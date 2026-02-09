'use static';
/**
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
import {
  describe,
  beforeEach,
  it,
  expect,
  Level,
  beforeAll,
  Size,
  TestType,
  afterEach
} from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import deviceInfo from "@ohos.deviceInfo"

export default function popupKeyboardAvoidMode() {
  describe("popupKeyboardAvoidMode", () => {
    let currentDeviceIsPC = false
    beforeAll(() => {
      console.info("popupKeyboardAvoidMode beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.nowear.api15.static", "EntryAbility")
      console.info("popupKeyboardAvoidMode beforeAll start")
      AppStorage.get<number>('winLeft') == 0 ? true : false;
      console.info("the value of the currentDeviceIsPC is " + currentDeviceIsPC)
      console.info("the value of the deviceType is " + deviceInfo.deviceType)
    })

    beforeEach(async () => {
      console.info("popupKeyboardAvoidMode beforeEach start")
      let options: router.RouterOptions = {
        url: "MainAbility/pages/popup/popupKeyboardAvoidMode",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear()
        let pages = routerInstance.getState()
        console.info(
          "get popupKeyboardAvoidMode state pages: " +
          JSON.stringify(pages)
        )
        if (!("popupKeyboardAvoidMode" == pages.name)) {
          console.info(
            "get popupKeyboardAvoidMode state pages.name: " +
            JSON.stringify(pages.name)
          )
          routerInstance.replaceUrl(options)
          await CommonFunc.sleep(2000)
        }
      } catch (err) {
        console.error("push popupKeyboardAvoidMode page error: " + err)
        expect().assertFail()
      }
    })

    /**
     * @tc.number   popupKeyboardAvoidMode_static_0100
     * @tc.name     popupKeyboardAvoidMode_static_0100
     * @tc.desc     popupKeyboardAvoidMode_static_0100
     * @tc.level    Level.LEVEL1
     */
    it("popupKeyboardAvoidMode_static_0100", Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("popupKeyboardAvoidMode_static_0100 START")
      if (!currentDeviceIsPC) {
        await CommonFunc.sleep(1000)
        let driver: Driver = Driver.create()
        let btn = await driver.findComponent(ON.id("popup"))
        await CommonFunc.sleep(1000)
        await (btn?.click() as Promise<void>)
        console.info("[popupKeyboardAvoidMode_static_0100] popup click")
        await CommonFunc.sleep(1000)
        let confirm = await driver.findComponent(ON.text("confirm"))

        let rect = await confirm!.getBounds()
        let height = rect.top
        console.info("[popupKeyboardAvoidMode_static_0100] height " + height)

        let btn0 = await driver.findComponent(ON.id("ipt"))
        await CommonFunc.sleep(1000)
        await (btn0?.click() as Promise<void>)
        await CommonFunc.sleep(1000)

        let rect1 = await confirm!.getBounds()
        let height1 = rect1.top
        console.info("[popupKeyboardAvoidMode_static_0100] height1 " + height1)
        expect(height - height1 > 0).assertTrue()
        await CommonFunc.sleep(1000)
        await (confirm?.click() as Promise<void>)
        await driver.triggerKey(2070)
      }
      console.info("[popupKeyboardAvoidMode_static_0100] END")
      done()
    })

    /**
     * @tc.number   popupKeyboardAvoidMode_static_0200
     * @tc.name     popupKeyboardAvoidMode_static_0200
     * @tc.desc     popupKeyboardAvoidMode_static_0200
     * @tc.level    Level.LEVEL1
     */
    it("popupKeyboardAvoidMode_static_0200", Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("popupKeyboardAvoidMode_static_0200 START")
      if (!currentDeviceIsPC) {
        await CommonFunc.sleep(1000)
        let driver: Driver = Driver.create()
        let btn = await driver.findComponent(ON.id("none"))
        await CommonFunc.sleep(1000)
        await (btn?.click() as Promise<void>)
        console.info("[popupKeyboardAvoidMode_0200] none click")
        await CommonFunc.sleep(1000)

        let btn1 = await driver.findComponent(ON.id("popup"))
        await CommonFunc.sleep(1000)
        await (btn1?.click() as Promise<void>)
        console.info("[popupKeyboardAvoidMode_static_0200] popup click")
        await CommonFunc.sleep(1000)

        let btn0 = await driver.findComponent(ON.id("ipt"))
        await CommonFunc.sleep(1000)
        await (btn0?.click() as Promise<void>)
        await CommonFunc.sleep(1000)

        let confirm = await driver.findComponent(ON.text("confirm"))

        expect(confirm != null).assertFalse()
        await driver.triggerKey(2070)
      }
      console.info("[popupKeyboardAvoidMode_static_0200] END")
      done()
    })

    /**
     * @tc.number   popupKeyboardAvoidMode_static_0300
     * @tc.name     popupKeyboardAvoidMode_static_0300
     * @tc.desc     popupKeyboardAvoidMode_static_0300
     * @tc.level    Level.LEVEL1
     */
    it("popupKeyboardAvoidMode_static_0300", Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("popupKeyboardAvoidMode_static_0300 START")
      if (!currentDeviceIsPC) {
        await CommonFunc.sleep(1000)
        let driver: Driver = Driver.create()
        let btn = await driver.findComponent(
          ON.id("default")
        )
        await CommonFunc.sleep(1000)
        await (btn?.click() as Promise<void>)
        console.info("[popupKeyboardAvoidMode_static_0300] default click")
        await CommonFunc.sleep(1000)
        let btn1 = await driver.findComponent(
          ON.id("CustomPopup")
        )
        await CommonFunc.sleep(1000)
        await (btn1?.click() as Promise<void>)
        console.info("[popupKeyboardAvoidMode_static_0300] CustomPopup click")
        await CommonFunc.sleep(1000)
        let text = await driver.findComponent(ON.id("text"))
        let rect = await text!.getBounds()
        let height = rect.top
        console.info("[popupKeyboardAvoidMode_static_0300] height " + height)

        let btn0 = await driver.findComponent(ON.id("ipt"))
        await CommonFunc.sleep(1000)
        await (btn0?.click() as Promise<void>)
        await CommonFunc.sleep(1000)

        let text1 = await driver.findComponent(ON.id("text"))
        let rect1 = await text1!.getBounds()
        let height1 = rect1.top

        console.info("[popupKeyboardAvoidMode_static_0300] height1 " + height1)
        expect(height - height1 > 0).assertTrue()
        await driver.triggerKey(2070)
      }
      console.info("[popupKeyboardAvoidMode_static_0300] END")
      done()
    })

    /**
     * @tc.number   popupKeyboardAvoidMode_static_0400
     * @tc.name     popupKeyboardAvoidMode_static_0400
     * @tc.desc     popupKeyboardAvoidMode_static_0400
     * @tc.level    Level.LEVEL1
     */
    it("popupKeyboardAvoidMode_static_0400", Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("popupKeyboardAvoidMode_static_0400 START")
      if (!currentDeviceIsPC) {
        await CommonFunc.sleep(1000)
        let driver: Driver = Driver.create()
        let btn = await driver.findComponent(ON.id("none"))
        await CommonFunc.sleep(1000)
        await (btn?.click() as Promise<void>)
        console.info("[popupKeyboardAvoidMode_static_0400] none click")
        await CommonFunc.sleep(1000)

        let btn1 = await driver.findComponent(
          ON.id("CustomPopup")
        )
        await CommonFunc.sleep(1000)
        await (btn1?.click() as Promise<void>)
        console.info("[popupKeyboardAvoidMode_static_0400] CustomPopup click")
        await CommonFunc.sleep(1000)

        let btn0 = await driver.findComponent(ON.id("ipt"))
        await CommonFunc.sleep(1000)
        await (btn0?.click() as Promise<void>)
        await CommonFunc.sleep(1000)

        let confirm = await driver.findComponent(ON.id("text"))

        expect(confirm != null).assertFalse()
        await driver.triggerKey(2070)
      }
      console.info("[popupKeyboardAvoidMode_static_0400] END")
      done()
    })
  })
}