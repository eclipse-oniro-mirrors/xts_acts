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
import { describe, beforeEach, afterEach, it, expect } from '@ohos/hypium'
import router from '@system.router'
import { Driver, ON } from '@ohos.UiTest'
import Utils from './Utils.ets'

export default function abilityTest() {
  const SUITE = 'SegmentButton'
  describe('ActsAceSegmentButtonTest', () => {
    beforeEach(async (done: Function) => {
      let options = {
        uri: "../testability/pages/Index",
      }
      try {
        router.clear();
        let pages = router.getState();
        if (pages == null || !("Index" == pages.name)) {
          let driver = Driver.create()
          await router.push(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error(`${SUITE} beforeEach error:` + JSON.stringify(err));
      }
      done()
    })
    afterEach(async (done: Function) => {
      let driver = Driver.create()
      await Utils.sleep(2000);
      done()
    })

    /*
    *tc.number Advanced_ui_SegmentButton_0100
    *tc.name   single select SegmentButton UI test
    *tc.desc   Test single select SegmentButton UI
    */
    it('Advanced_ui_SegmentButton_0100', 0, async (done: Function) => {
      let driver = Driver.create()
      let singleTextSegmentButton = await driver.findComponent(ON.text('单选文字1'))
      let singleTextSegmentButtonIsEnabled = await singleTextSegmentButton.isEnabled()
      expect(singleTextSegmentButtonIsEnabled).assertTrue()
      let singleTextSegmentButtonType = await singleTextSegmentButton.getType()
      expect(singleTextSegmentButtonType).assertEqual('Text')
      let singleIconTextSegmentButton = await driver.findComponent(ON.text('单选图标文字1'))
      let singleIconTextSegmentButtonType = await singleIconTextSegmentButton.getType()
      expect(singleIconTextSegmentButtonType).assertEqual('Text')
      let singleIconTextSegmentButtonIsEnabled = await singleIconTextSegmentButton.isEnabled()
      expect(singleIconTextSegmentButtonIsEnabled).assertTrue()
      let popItemButton = await driver.findComponent(ON.text('pop item'))
      if (await popItemButton.isClickable()) {
        await popItemButton.click()
      }
      let shiftItemButton = await driver.findComponent(ON.text('shift item'))
      if (await shiftItemButton.isClickable()) {
        await shiftItemButton.click()
      }
      let pushItemButton = await driver.findComponent(ON.text('push item'))
      if (await pushItemButton.isClickable()) {
        await pushItemButton.click()
      }
      await Utils.sleep(2000);
      await driver.assertComponentExist(ON.text('push button'))
      done()
    })

    /*
    *tc.number Advanced_ui_SegmentButton_0200
    *tc.name   multiple select SegmentButton UI test
    *tc.desc   Test multiple SegmentButton UI
    */
    it('Advanced_ui_SegmentButton_0200', 0, async (done: Function) => {
      let driver = Driver.create()
      let multipleTextSegmentButton = await driver.findComponent(ON.text('多选文字1'))
      let multipleTextSegmentButtonType = await multipleTextSegmentButton.getType()
      expect(multipleTextSegmentButtonType).assertEqual('Text')
      let multipleTextSegmentButtonIsEnabled = await multipleTextSegmentButton.isEnabled()
      expect(multipleTextSegmentButtonIsEnabled).assertTrue()
      let multipleIconTextSegmentButton = await driver.findComponent(ON.text('多选图标文字1'))
      let multipleIconTextSegmentButtonType = await multipleIconTextSegmentButton.getType()
      expect(multipleIconTextSegmentButtonType).assertEqual('Text')
      let multipleIconTextSegmentButtonIsEnabled = await multipleIconTextSegmentButton.isEnabled()
      expect(multipleIconTextSegmentButtonIsEnabled).assertTrue()
      let unShiftItemButton = await driver.findComponent(ON.text('unshift item'))
      if (await unShiftItemButton.isClickable()) {
        await unShiftItemButton.click()
      }
      await Utils.sleep(2000);
      await driver.assertComponentExist(ON.text('unshift button'))
      done()
    })

    /*
    *tc.number Advanced_ui_SegmentButton_0300
    *tc.name   tab SegmentButton UI test
    *tc.desc   Test tab SegmentButton UI
    */
    it('Advanced_ui_SegmentButton_0300', 0, async (done: Function) => {
      let driver = Driver.create()
      let tabSegmentButton = await driver.findComponent(ON.text('页签1'))
      let tabSegmentButtonType = await tabSegmentButton.getType()
      expect(tabSegmentButtonType).assertEqual('Text')
      let tabSegmentButtonIsEnabled = await tabSegmentButton.isEnabled()
      expect(tabSegmentButtonIsEnabled).assertTrue()
      let spliceItemButton = await driver.findComponent(ON.text('splice item'))
      if (await spliceItemButton.isClickable()) {
        await spliceItemButton.click()
      }
      await Utils.sleep(2000);
      await driver.assertComponentExist(ON.text('splice button'))
      done()
    })
  })
}