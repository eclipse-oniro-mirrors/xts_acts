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
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver } from '@kit.TestKit';
import { waitForExist } from './WaitTest.test';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

let emitKey = "emitOnPageBegin";
const driver = Driver.create();
export default function webJsunit() {
  describe('ActsAceWebDevTest', () => {
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      done();
    })
    /**
     * @tc.name   onPageBegin
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_038
     * @tc.desc   onPageBegin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onPageBegin', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {

      emitKey = "emitOnPageBegin";
      Utils.emitEvent(emitKey,141321)
      let isReturn = false;
      Utils.registerContainEvent("onPageBegin", "index.html", 141330, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webcomponent',driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })
    /**
     * @tc.name   onPageEnd
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_039
     * @tc.desc   onPageEnd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onPageEnd', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitOnPageEnd";
      Utils.emitEvent(emitKey,141321)
      let isReturn = false;
      Utils.registerContainEvent("onPageEnd", "index.html", 141340, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webcomponent',driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })
    /**
     * @tc.name   onResourceLoad
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_005
     * @tc.desc   onResourceLoad
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onResourceLoad', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitOnResourceLoad";
      Utils.emitEvent(emitKey,141321)
      let isReturn = false;
      Utils.registerContainEvent("onResourceLoad", "second.html", 141350, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webcomponent',driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })
    /**
     * @tc.name   stop
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_055
     * @tc.desc   stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('stop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitStop";
      Utils.emitEvent(emitKey,141321)
      let isReturn = false;
      Utils.registerEvent("stop", true, 141360, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webcomponent',driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })
  })
}
