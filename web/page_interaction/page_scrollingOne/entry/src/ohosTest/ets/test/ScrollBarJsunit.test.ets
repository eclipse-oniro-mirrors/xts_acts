/**
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
import { beforeAll, afterEach, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';
import { BusinessError } from '@kit.BasicServicesKit';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
// @ts-nocheck
let emitKey = ""
let tcName = ""
const EVENT_ID_SET_SUITE_KEY = 184001;
let driver = Driver.create();

export default function ActsAceWebviewScrollBar() {
  describe('TEST_ScrollBar_Keep', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/scrollBar',
      }
      try {
        await Utils.sleep(1000)
        router.clear();
        let pages = router.getState();
        console.info("get scrollBar state success " + JSON.stringify(pages));
        if (!("scrollBar" == pages.name)) {
          console.info("get scrollBar state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push scrollBar page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push scrollBar page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      try {
        await driver.waitForComponent(ON.id("webcomponentScrollBy"),10000);
      }catch (e) {
        const error = e as BusinessError;
        console.error(`${emitKey} ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
      }
      done();
    })

    it('testScrollBarKeep001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async  (done: Function) => {
      emitKey = 'emitScrollBarKeep001';
      tcName = 'testScrollBarKeep001'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, "BarState.Auto", 184010, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrollBy", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    });

    it('testScrollBarKeep002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async  (done: Function) =>{
      emitKey = 'emitScrollBarKeep002';
      tcName = 'testScrollBarKeep002'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, "ScrollDirection.Vertical", 184020, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentScrollBy", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    });

  })
}
