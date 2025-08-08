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

import { beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';


export default function webResourceResponseGet() {

  describe('WebResourceResponseGetTestSuite', () => {

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(2000);
      console.info("webResourceResponseGet beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_SCROLLTYPE_0100
    * @tc.name       : testScrollType001
    * @tc.desc       : test ScrollType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testScrollType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testScrollType001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testScrollType001", 0, 37023, done);
      sendEventByKey('WebResourceResponseGetButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_SCROLLBYWITHRESULT_0100
    * @tc.name       : testscrollByWithResult001
    * @tc.desc       : test ScrollByWithResult
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testscrollByWithResult001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testscrollByWithResult001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testscrollByWithResult001", "error", 37024, done);
      sendEventByKey('WebResourceResponseGetButton', 10, '');
    })
  })
}
