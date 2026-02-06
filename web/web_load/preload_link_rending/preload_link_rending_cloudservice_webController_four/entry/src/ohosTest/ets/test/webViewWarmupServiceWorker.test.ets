/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 201270;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function ActsAceWebViewWarmupServiceWorker() {
  describe('ActsAceWebViewWarmupServiceWorker', () => {
      
    beforeAll(async (done: Function) => {
        let options : router.RouterOptions = {
            url: 'testability/pages/webViewWarmupServiceWorker',
        }
        
        try {
            router.clear();
            let pages = router.getState();
            console.info("get webViewWarmupServiceWorker state success " + JSON.stringify(pages));
            if (!("webViewWarmupServiceWorker" == pages.name)) {
                console.info("get webViewWarmupServiceWorker state success " + JSON.stringify(pages.name));
                await router.pushUrl(options);
                console.info("push webViewWarmupServiceWorker state success");
            }
        } catch (err) {
            console.error("push webViewWarmupServiceWorker page error:" + err);
        }
        await driver.waitForComponent(ON.id("webViewWarmupServiceWorker"), 10000);
        console.log("waitForComponent webViewWarmupServiceWorker");
        done()
    });
    
    beforeEach(async (done: Function) => {
        config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
        })
        done();
    })

    /*
     *@tc.number SUB_ACE_WEB_WarmupServiceWorker_API_0001
     *@tc.name testWebViewWarmupServiceWorker
     *@tc.desc test WarmupServiceWorker
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 0
     */
    it('testWebViewWarmupServiceWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitWebViewWarmupServiceWorker", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewWarmupServiceWorker", true, 201280, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewWarmupServiceWorker");
      if (await Utils.waitForExist(() => isReturn, 'testWebViewWarmupServiceWorker' + '_returnCheck', true, 1000)) {
        done();
      }
    })
  })
}