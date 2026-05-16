/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from '../../src/test/Util.test';
import inspector from '@ohos.arkui.inspector';
import { Driver, ON } from '@kit.TestKit';
import events_emitter from '@ohos.events.emitter';
import { accessibility, config } from '@kit.AccessibilityKit';
import wifiMg from '@ohos.wifiManager';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';


export default function webErrorPageTest() {
  describe('webErrorPageTest', (): void => {
    beforeAll(async (): Promise<void> => {
      console.log('App start')
    });
    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info('web beforeEach start');
    })

    /**
     * @tc.name   testSetErrorPageEnabledAndGetErrorPageEnabledStatic01
     * @tc.number SUB_ACE_WEB_ERRORPAGE_API_0001
     * @tc.desc   test setErrorPageEnabled true getErrorPageEnabled true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetErrorPageEnabledAndGetErrorPageEnabledStatic01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitSetErrorPageEnabledAndGetErrorPageEnabled01', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testSetErrorPageEnabledAndGetErrorPageEnabled01', true, 2025081401, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebErrorPageButton', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   testSetErrorPageEnabledAndGetErrorPageEnabledStatic02
     * @tc.number SUB_ACE_WEB_ERRORPAGE_API_0002
     * @tc.desc   test setErrorPageEnabled false getErrorPageEnabled false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetErrorPageEnabledAndGetErrorPageEnabledStatic02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitSetErrorPageEnabledAndGetErrorPageEnabled02', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testSetErrorPageEnabledAndGetErrorPageEnabled02', false, 2025081402, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebErrorPageButton', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   testSetErrorPageEnabledErrorCodeStatic03
     * @tc.number SUB_ACE_WEB_ERRORPAGE_API_0005
     * @tc.desc   test setErrorPageEnabled init error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetErrorPageEnabledErrorCodeStatic03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitSetErrorPageEnabledErrorCode03', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testSetErrorPageEnabledErrorCode03', 17100001, 2025081405, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebErrorPageButton', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   testGetErrorPageEnabledErrorCodeStatic01
     * @tc.number SUB_ACE_WEB_ERRORPAGE_API_0006
     * @tc.desc   test setErrorPageEnabled init error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetErrorPageEnabledErrorCodeStatic01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitGetErrorPageEnabledErrorCode01', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testGetErrorPageEnabledErrorCode01', 17100001, 2025081406, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebErrorPageButton', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   testOnOverrideErrorPageStatic01
     * @tc.number SUB_ACE_WEB_ERRORPAGE_API_0007
     * @tc.desc   test onOverrideErrorPage invalid url
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnOverrideErrorPageStatic01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitOnOverrideErrorPage01', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testOnOverrideErrorPage01', 'https://www.baiiiiiiiiidu.com/', 26031035, done);
        Utils.registerEvent('testOnOverrideErrorPage01', true, 26031036, done);
        Utils.registerEvent('testOnOverrideErrorPage01', true, 26031037, done);
        Utils.registerEvent('testOnOverrideErrorPage01', false, 26031038, done);
        Utils.registerEvent('testOnOverrideErrorPage01', false, 26031039, done);
        Utils.registerEvent('testOnOverrideErrorPage01', 'GET', 26031040, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebErrorPageButton', 10, '');
        await Utils.msSleep(2000);
        done()
      })
  })
}
