'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeEach, afterEach, it, expect, Level, beforeAll } from "../../../../hypium/index"
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest'
import CommonFunc from "../../../ets/MainAbility/common/Common";
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import {UtilsTest, startAbility, stopApplication} from "../Util.test"
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function segmentbutton() {
  const SUITE = 'SegmentButton'
  describe('segmentbutton', () => {
    beforeAll(() => {
      console.info("ActsAceSegmentButtonTest beforeEach start");

     await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/SegmentButton/SegmentButtonIndex",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SearchJsunit state pages:" + "");
        if (!("SegmentButtonIndex" == pages.name)) {
          console.info("get SearchJsunit pages.name:" + "");
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error(`${SUITE} beforeEach error:` + JSON.stringify(err));
      }
    })
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(500);
    })

    
    /**
     * @tc.number   Advanced_ui_SegmentButton_static_0100
     * @tc.name     Advanced_ui_SegmentButton_static_0100
     * @tc.desc     Advanced_ui_SegmentButton_static_0100
     * @tc.level    Level.LEVEL0
     */
it('Advanced_ui_SegmentButton_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
  console.log('Advanced_ui_SegmentButton_static_0100', 'singleTextSegmentButton start')
      let driver = Driver.create()
      await CommonFunc.sleep(2000);
  console.log('Advanced_ui_SegmentButton_static_0100', 'singleTextSegmentButton before')
      let singleTextSegmentButton = await driver.findComponent(ON.text('单选文字1'))
      await CommonFunc.sleep(500);
  console.log('Advanced_ui_SegmentButton_static_0100', 'singleTextSegmentButton before：' + singleTextSegmentButton)
  console.log('Advanced_ui_SegmentButton_static_0100', 'singleTextSegmentButton success')
      let singleTextSegmentButtonIsEnabled = await (singleTextSegmentButton?.isEnabled() as Promise<Boolean>)
  console.log('Advanced_ui_SegmentButton_static_0100', 'isEnabled success')
      await CommonFunc.sleep(500);

      let singleTextSegmentButtonType = await (singleTextSegmentButton?.getType() as Promise<String>)
      await CommonFunc.sleep(500);

      let singleIconTextSegmentButton = await driver.findComponent(ON.text('单选图标文字1'))
      await CommonFunc.sleep(500);
      let singleIconTextSegmentButtonType = await (singleIconTextSegmentButton?.getType() as Promise<String>)
      await CommonFunc.sleep(500);

      let singleIconTextSegmentButtonIsEnabled = await (singleIconTextSegmentButton?.isEnabled() as Promise<Boolean>)
      await CommonFunc.sleep(500);

        expect(singleTextSegmentButtonIsEnabled).assertTrue()
        expect(singleTextSegmentButtonType).assertEqual('Text')
        expect(singleIconTextSegmentButtonType).assertEqual('Text')
        expect(singleIconTextSegmentButtonIsEnabled).assertTrue()

      let popItemButton = await driver.findComponent(ON.text('pop item'))
      await CommonFunc.sleep(500);
      if (await (popItemButton?.isClickable() as Promise<Boolean>)) {
        await (popItemButton?.click() as Promise<void>)
      }
      await CommonFunc.sleep(500);
      let shiftItemButton = await driver.findComponent(ON.text('shift item'))
      await CommonFunc.sleep(500);
      if (await (shiftItemButton?.isClickable() as Promise<Boolean>)) {
        await (shiftItemButton?.click() as Promise<void>)
      }
      await CommonFunc.sleep(500);
      let pushItemButton = await driver.findComponent(ON.text('push item'))
      await CommonFunc.sleep(500);
      if (await (pushItemButton?.isClickable() as Promise<Boolean>)) {
        await (pushItemButton?.click() as Promise<void>)
      }
      await driver.assertComponentExist(ON.text('push button'))
      done()
    })
    
    /**
     * @tc.number   Advanced_ui_SegmentButton_static_0200
     * @tc.name     Advanced_ui_SegmentButton_static_0200
     * @tc.desc     Advanced_ui_SegmentButton_static_0200
     * @tc.level    Level.LEVEL0
     */
it('Advanced_ui_SegmentButton_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create()
      let multipleTextSegmentButton = await driver.findComponent(ON.text('多选文字1'))
      await CommonFunc.sleep(500);
      let multipleTextSegmentButtonType = await (multipleTextSegmentButton?.getType() as Promise<String>)
      await CommonFunc.sleep(500);

      let multipleTextSegmentButtonIsEnabled = await (multipleTextSegmentButton?.isEnabled() as Promise<Boolean>)
      await CommonFunc.sleep(500);

      let multipleIconTextSegmentButton = await driver.findComponent(ON.text('多选图标文字1'))
      await CommonFunc.sleep(500);
      let multipleIconTextSegmentButtonType = await (multipleIconTextSegmentButton?.getType() as Promise<String>)
      await CommonFunc.sleep(500);

      let multipleIconTextSegmentButtonIsEnabled = await (multipleIconTextSegmentButton?.isEnabled() as Promise<Boolean>)
      await CommonFunc.sleep(500);


        expect(multipleTextSegmentButtonType).assertEqual('Text')
        expect(multipleTextSegmentButtonIsEnabled).assertTrue()
        expect(multipleIconTextSegmentButtonType).assertEqual('Text')
        expect(multipleIconTextSegmentButtonIsEnabled).assertTrue()

      let unShiftItemButton = await driver.findComponent(ON.text('unshift item'))
      await CommonFunc.sleep(500);
      if (await (unShiftItemButton?.isClickable() as Promise<Boolean>)) {
        await (unShiftItemButton?.click() as Promise<void>)
      }
      await CommonFunc.sleep(500);
      await driver.assertComponentExist(ON.text('unshift button'))
      await CommonFunc.sleep(500);
      done()
    })

    /**
     * @tc.number   Advanced_ui_SegmentButton_static_0300
     * @tc.name     Advanced_ui_SegmentButton_static_0300
     * @tc.desc     Advanced_ui_SegmentButton_static_0300
     * @tc.level    Level.LEVEL0
     */
it('Advanced_ui_SegmentButton_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create()
      let tabSegmentButton = await driver.findComponent(ON.text('页签1'))
      await CommonFunc.sleep(500);
      let tabSegmentButtonType = await (tabSegmentButton?.getType() as Promise<String>)
      await CommonFunc.sleep(500);

      let tabSegmentButtonIsEnabled = await (tabSegmentButton?.isEnabled() as Promise<Boolean>)
      await CommonFunc.sleep(500);

      let spliceItemButton = await driver.findComponent(ON.text('splice item'))

        expect(tabSegmentButtonType).assertEqual('Text')
        expect(tabSegmentButtonIsEnabled).assertTrue()

      await CommonFunc.sleep(500);
      if (await (spliceItemButton?.isClickable() as Promise<Boolean>)) {
        await (spliceItemButton?.click() as Promise<void>)
      }
      await CommonFunc.sleep(500);
      await driver.assertComponentExist(ON.text('splice button'))
      await CommonFunc.sleep(500);
      done()
    })
  })
}