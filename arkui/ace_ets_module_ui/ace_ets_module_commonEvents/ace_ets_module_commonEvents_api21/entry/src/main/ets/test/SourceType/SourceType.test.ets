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

import {describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import {UiComponent, Component, Driver, ON, BY, MouseButton} from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function SourceTypeTest() {

  describe('SourceTypeTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SourceType/SourceType',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SourceType state pages: " + JSON.stringify(pages));
        if (!("SourceType" == pages.name)) {
          console.info("get SourceType state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push SourceType success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SourceType page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SourceType after each called");
    });

    /**
     * @tc.number    SourceType_0010
     * @tc.name      SourceType_0010
     * @tc.desc      KEY
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('SourceType_0010', Level.LEVEL0, async (done: Function) => {
    console.info('SourceType_0010 START');
    let driver = await Driver.create()
    await CommonFunc.sleep(500);

    let keyBtn1 = await driver.findComponent(ON.id('changeSourceType2_id'));
    await keyBtn1.click();
    await CommonFunc.sleep(500);

    await driver.triggerKey(2049);
    await CommonFunc.sleep(500);

    await driver.triggerKey(2049);
    await CommonFunc.sleep(500);

    await driver.triggerKey(2049);
    await CommonFunc.sleep(500);

    await driver.triggerKey(2049);
    await CommonFunc.sleep(500);

    await driver.triggerKey(2054);
    await CommonFunc.sleep(500);

    let strJson = getInspectorByKey('sourceType1_id');
    let obj: ESObject = JSON.parse(strJson);
    expect(obj.$attrs.label).assertEqual('4'); 

    console.info('[SourceType_0010] END');
    done();
    });

    /**
     * @tc.number    SourceType_0020
     * @tc.name      SourceType_0020
     * @tc.desc      JOYSTICK
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('SourceType_0020', Level.LEVEL0, async (done: Function) => {
    console.info('SourceType_0020 START');
    let driver = await Driver.create()
    await CommonFunc.sleep(1000);

    let joystickBtn1 = await driver.findComponent(ON.id('changeSourceType3_id'));
    await joystickBtn1.click();
    await CommonFunc.sleep(1000);

    await driver.triggerKey(2301);
    console.info('button A succ');
    await CommonFunc.sleep(1000);

    let strJson = getInspectorByKey('sourceType1_id');
    let obj: ESObject = JSON.parse(strJson);
    expect(obj.$attrs.label).assertEqual('5'); 

    console.info('[SourceType_0020] END');
    done();
    });
  })
}
