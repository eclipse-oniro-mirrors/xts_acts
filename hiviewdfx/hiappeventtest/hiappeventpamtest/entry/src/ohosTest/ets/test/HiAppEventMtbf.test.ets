/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { hiAppEvent, hilog } from '@kit.PerformanceAnalysisKit';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size} from '@ohos/hypium'


export default function HiAppEventMtbf() {
  describe('HiAppEventMtbf', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    const TEST_DOMAIN = 'test_domain';
    const TEST_NAME = 'test_name';

    /**
     * @tc.number HiAppEventWatcherMtbf001
     * @tc.name HiAppEventWatcherMtbf001
     * @tc.desc test watcher onReceive with two consecutive callbacks.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('HiAppEventWatcherMtbf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0xA8A8, 'hiAppEvent', `HiAppEventWatcherMtbf001 start`);
      for (let i = 0; i < 10; i++) {
        let eventName = "";
        let watcher: hiAppEvent.Watcher = {
          name: "watcher_mtbf1",
          appEventFilters: [
            {
              domain: "testDomain"
            }
          ],
          onReceive: (domain, appEventGroups) => {
            for (const eventGroup of appEventGroups) {
              for (const eventInfo of eventGroup.appEventInfos) {
                let curName = eventInfo.name;
                console.log("hiappevent write name:" + curName);
                expect(eventInfo.name != eventName).assertTrue();
                eventName = curName;
              }
            }
          }
        };
        let result = hiAppEvent.addWatcher(watcher);
        expect(result != null).assertTrue()
        for (let j = 0; j < 10; j++) {
          hiAppEvent.write({
            domain: "testDomain",
            name: "name" + i + "n" + j,
            eventType: hiAppEvent.EventType.FAULT,
            params: { "key": "value" }
          }, (err) => {
            expect(err == null).assertTrue();
          })
        }
        setTimeout(() => {
          hiAppEvent.removeWatcher(watcher);
          done();
        }, 1000)
      }
      hilog.info(0xA8A8, 'hiAppEvent', `HiAppEventWatcherMtbf001 end`);
    })

    /**
     * @tc.number HiAppEventWatcherMtbf002
     * @tc.name HiAppEventWatcherMtbf002
     * @tc.desc test watcher onReceive with two consecutive callbacks.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('HiAppEventWatcherMtbf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0xA8A8, 'hiAppEvent', `HiAppEventWatcherMtbf002 start`);
      for (let i = 0; i < 10; i++) {
        let watcher: hiAppEvent.Watcher  = {
          name: "watcher_mtbf2",
          appEventFilters: [
            {domain: TEST_DOMAIN},
          ],
          onReceive: (domain, appEventGroups) => {
            hiAppEvent.removeWatcher(watcher);
          }
        };
        let result = hiAppEvent.addWatcher(watcher);
        expect(result != null).assertTrue();
        for (let j = 0; j < 10; j++) {
          hiAppEvent.write({
            domain: TEST_DOMAIN,
            name: TEST_NAME + i + "m" + j,
            eventType: hiAppEvent.EventType.FAULT,
            params: { "key": "value" }
          }, (err) => {
            expect(err == null).assertTrue();
          })
        }
        setTimeout(() => {
          hiAppEvent.removeWatcher(watcher);
          done();
        }, 1000);
      }
      hilog.info(0xA8A8, 'hiAppEvent', `HiAppEventWatcherMtbf002 end`);
    })

  })
}