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

import { afterEach, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webInitTest() {

  describe('WebInitTest', () => {
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebInitTest afterEach start");
      await Utils.sleep(2000);
      console.info("WebInitTest afterEach end");
      done();
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_032
     *tc.name onPrompt
     *tc.desic Triggered when the web page wants to display a JavaScript prompt() dialog
     */
    it('onPrompt', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitOnPrompt", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("onPrompt", "age", 178, done);
      sendEventByKey('WebInitTestButton', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_041
     *tc.name onAlert
     *tc.desic Triggered when the Web wants to display a JavaScript alert() dialog
     */
    it('onAlert', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitOnAlert", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("onAlert", "alert test", 63, done);
      sendEventByKey('WebInitTestButton', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_042
     *tc.name onConfirm
     *tc.desic Triggered when the web page wants to display a JavaScript confirm() dialog
     */
    it('onConfirm', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitOnConfirm", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("onConfirm", "confirm test", 64, done);
      sendEventByKey('WebInitTestButton', 10, '');
    })
  })
}
