/**
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import Utils from '../../MainAbility/common/Utils';
import { Driver, ON } from '@ohos.UiTest';
import inputEventClient from '@ohos.multimodalInput.inputEventClient';
import config from '@ohos.accessibility.config'
import accessibility from '@ohos.accessibility';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture']
const BUNDLE_NAME = 'com.arkui.ace.picker'

export default function SliderInterfaceTest() {
  describe('SliderInterfaceTest', () => {
    const routerPush = async (target: string) => {
      let options: router.RouterOptions = {
        url: `MainAbility/pages/Slider/SliderInterface/${target}`,
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info(`get ${target} state pages:` + JSON.stringify(pages));
        console.info(`get ${target} pages.name:` + JSON.stringify(pages.name));
        if (!(target == pages.name)) {
          let result = router.replace(options);
          await Utils.sleep(1000);
          console.info(`push ${target} page result:` + JSON.stringify(result));
          let pages = router.getState();
          expect(pages.name).assertContain(target)
        }
      } catch (err) {
        console.error(`push ${target} page error:` + err);
      }
    }
    beforeEach(async () => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`)
      }).catch((err: object) => {
        console.error(`failed to enable,${err}`)
      })
    })

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("SliderInterfaceTest after each called");
    });

    /*
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0180
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0180
     * @tc.desc        direction Axis.Vertical ,reverse true
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0180', 3, async (done: Function) => {
      await routerPush("slider01")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('Slider01');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0180] obj1.$attrs.constructor is: " +
      JSON.stringify(obj1.$attrs.constructor));
      expect(obj1.$attrs.constructor.direction).assertEqual('Axis.Vertical');
      expect(obj1.$attrs.constructor.reverse).assertEqual('true');
      done();
    });

    /*
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0200
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0200
     * @tc.desc        direction Axis.Vertical
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0200', 3, async (done: Function) => {
      await routerPush("slider02")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('Slider02');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0200] obj1.$attrs.constructor is: " +
      JSON.stringify(obj1.$attrs.constructor));
      expect(obj1.$attrs.constructor.direction).assertEqual('Axis.Vertical');
      done();
    });

    /*
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0210
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0210
     * @tc.desc        max < 0
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0210', 3, async (done: Function) => {
      await routerPush("slider03")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('Slider03');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0210] obj1.$attrs.constructor is: " +
      JSON.stringify(obj1.$attrs.constructor));
      expect(obj1.$attrs.constructor.max).assertEqual('100.000000');
      done();
    });

    /*
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0250
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0250
     * @tc.desc        min = decimal number greater than 0
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0250', 3, async (done: Function) => {
      await routerPush("slider04")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('Slider04');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0250] obj1.$attrs.constructor is: " +
      JSON.stringify(obj1.$attrs.constructor));
      expect(obj1.$attrs.constructor.min).assertEqual('0.000000');
      done();
    });

    /*
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0380
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0380
     * @tc.desc        Do not set showTips, the default value of showTips is false
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0380', 3, async (done: Function) => {
      await routerPush("slider05")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('Slider05');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0380] obj1.$attrs.constructor is: " +
      JSON.stringify(obj1.$attrs.constructor));
      expect(obj1.$attrs.showTips).assertEqual('false');
      done();
    });

    /*
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0390
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0390
     * @tc.desc        Repeated setting of showTips
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0390', 3, async (done: Function) => {
      await routerPush("slider06")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('Slider06');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0390] obj1.$attrs.constructor is: " +
      JSON.stringify(obj1.$attrs.constructor));
      expect(obj1.$attrs.showTips).assertEqual('true');
      done();
    });

    /*
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0420
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0420
     * @tc.desc        showTips = false
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0420', 3, async (done: Function) => {
      await routerPush("slider07")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('Slider07');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0420] obj1.$attrs.constructor is: " +
      JSON.stringify(obj1.$attrs.constructor));
      expect(obj1.$attrs.showTips).assertEqual('false');
      done();
    });

    /*
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0430
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0430
     * @tc.desc        showTips = true
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0430', 3, async (done: Function) => {
      await routerPush("slider08")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('Slider08');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0430] obj1.$attrs.constructor is: " +
      JSON.stringify(obj1.$attrs.constructor));
      expect(obj1.$attrs.showTips).assertEqual('true');
      done();
    });

    /*
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0440
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0440
     * @tc.desc        Do not set the width
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0440', 3, async (done: Function) => {
      await routerPush("slider09")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('Slider09');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0440] obj1.$attrs.width is: " +
      JSON.stringify(obj1.$attrs.width));
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0440] obj1.$attrs.height is: " +
      JSON.stringify(obj1.$attrs.height));
      expect(obj1.$attrs.width).assertEqual('300.00vp');
      done();
    });

    /*
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0450
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0450
     * @tc.desc        drag and look onChange
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0450', 3, async (done: Function) => {
      await routerPush("slider10")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let slider = await driver.findComponent(ON.id('Slider10'));
      let rect = await slider.getBounds();
      console.info(`rect is: ` + JSON.stringify(rect))
      await driver.drag(rect.left, Math.round((rect.top + rect.bottom) / 2),
        rect.left + Math.round((rect.right - rect.left) / 4), Math.round((rect.top + rect.bottom) / 2), 600)
      console.info(`drag is: ` + rect.left, Math.round((rect.top + rect.bottom) / 2),
        rect.left + Math.round((rect.right - rect.left) / 4), Math.round((rect.top + rect.bottom) / 2), 600)
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('Slider10');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0450] obj1.$attrs.constructor.value is: " +
      JSON.stringify(obj1.$attrs.constructor.value));
      expect(obj1.$attrs.constructor.value).assertEqual("20.000000")
      done();
    });

    /*
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0480
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0480
     * @tc.desc        Set step to an integer greater than 0
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0480', 3, async (done: Function) => {
      await routerPush("slider11")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);

      let slider = await driver.findComponent(ON.id('Slider11'));
      let rect = await slider.getBounds();
      console.info(`rect is: ` + JSON.stringify(rect))
      await driver.drag(rect.left, Math.round((rect.top + rect.bottom) / 2),
        rect.left + Math.round((rect.right - rect.left) / 4), Math.round((rect.top + rect.bottom) / 2), 600)
      console.info(`drag is: ` + rect.left, Math.round((rect.top + rect.bottom) / 2),
        rect.left + Math.round((rect.right - rect.left) / 4), Math.round((rect.top + rect.bottom) / 2), 600)
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('Slider11');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0480] obj1.$attrs.constructor.value is: " +
      JSON.stringify(obj1.$attrs.constructor.value));
      expect(obj1.$attrs.constructor.value).assertEqual("20.000000")
      done();
    });

    /*
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0640
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0640
     * @tc.desc        Set value to a negative number
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0640', 3, async (done: Function) => {
      await routerPush("slider12")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);

      let strJson1 = getInspectorByKey('Slider12');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0640] obj1.$attrs.constructor.value is: " +
      JSON.stringify(obj1.$attrs.constructor.value));
      expect(obj1.$attrs.constructor.value).assertEqual('0.000000');
      done();
    });

    /*
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0650
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0650
     * @tc.desc        Set value to exceed the default maximum value
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0650', 3, async (done: Function) => {
      await routerPush("slider13")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);

      let strJson1 = getInspectorByKey('Slider13');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0650] obj1.$attrs.constructor.value is: " +
      JSON.stringify(obj1.$attrs.constructor.value));
      expect(obj1.$attrs.constructor.value).assertEqual('100.000000');
      done();
    });

    /*
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0660
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0660
     * @tc.desc        click and drag, Begin 0 -> Moving 1 -> End 2
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0660', 3, async (done: Function) => {
      await routerPush("slider14")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let slider = await driver.findComponent(ON.id('Slider14'));
      let rect = await slider.getBounds();
      console.info(`rect is: ` + JSON.stringify(rect))
      await driver.drag(rect.left, Math.round((rect.top + rect.bottom) / 2),
        rect.left + Math.round((rect.right - rect.left) / 4), Math.round((rect.top + rect.bottom) / 2), 600)
      console.info(`drag is: ` + rect.left, Math.round((rect.top + rect.bottom) / 2),
        rect.left + Math.round((rect.right - rect.left) / 4), Math.round((rect.top + rect.bottom) / 2), 600)
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('Slider14');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0660] obj1.$attrs.constructor.value is: " +
      JSON.stringify(obj1.$attrs.constructor.value));
      expect(obj1.$attrs.constructor.value).assertEqual('20.000000');
      done();
    });

    /*
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0670
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0670
     * @tc.desc        click block and drag, Begin 0 -> Moving 1 -> End 2
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0670', 3, async (done: Function) => {
      await routerPush("slider15")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let slider = await driver.findComponent(ON.id('Slider15'));
      let rect = await slider.getBounds();
      console.info(`rect is: ` + JSON.stringify(rect))
      await Utils.sleep(1000);
      await driver.drag(rect.left, Math.round((rect.top + rect.bottom) / 2),
        rect.left + Math.round((rect.right - rect.left) / 8), Math.round((rect.top + rect.bottom) / 2), 600)
      console.info(`drag is: [SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0670] ` + rect.left,
        Math.round((rect.top + rect.bottom) / 2), rect.left + Math.round((rect.right - rect.left) / 8),
        Math.round((rect.top + rect.bottom) / 2), 600)
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('Slider15');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0670] obj1.$attrs.constructor.value is: " +
      JSON.stringify(obj1.$attrs.constructor.value));
      expect(obj1.$attrs.constructor.value).assertEqual('10.000000');
      done();
    });

    /*
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0680
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0680
     * @tc.desc        click block and drag, Begin 0 -> End 2 ,without Moving as steps
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0680', 3, async (done: Function) => {
      await routerPush("slider16")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);

      let slider = await driver.findComponent(ON.id('Slider16'));
      let rect = await slider.getBounds();
      console.info(`rect is: ` + JSON.stringify(rect))
      await driver.drag(rect.left, Math.round((rect.top + rect.bottom) / 2), rect.left + 55,
        Math.round((rect.top + rect.bottom) / 2), 600)
      console.info(`drag is: `, rect.left, Math.round((rect.top + rect.bottom) / 2), rect.left + 55,
        Math.round((rect.top + rect.bottom) / 2), 600)
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('Slider16');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0680] obj1.$attrs.constructor.value is: " +
      JSON.stringify(obj1.$attrs.constructor.value));
      expect(obj1.$attrs.constructor.value).assertEqual('0.000000');
      done();
    });

    /*
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0690
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0690
     * @tc.desc        click , Begin 0 -> Click 3 -> End 2
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0690', 3, async (done: Function) => {
      await routerPush("slider17")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let slider = await driver.findComponent(ON.id('Slider17'));
      let rect = await slider.getBounds();
      console.info(`rect is: ` + JSON.stringify(rect))
      await driver.click(rect.left + Math.round((rect.right - rect.left) / 5), Math.round((rect.top + rect.bottom) / 2))
      console.info(`click is: ` + rect.left + Math.round((rect.right - rect.left) / 5),
        Math.round((rect.top + rect.bottom) / 2))
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('Slider17');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0690] obj1.$attrs.constructor.value is: " +
      JSON.stringify(obj1.$attrs.constructor.value));
      expect(obj1.$attrs.constructor.value).assertEqual('20.000000');
      done();
    });

    /*
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0700
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0700
     * @tc.desc        click block ， Begin 0
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0700', 3, async (done: Function) => {
      await routerPush("slider18")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let slider = await driver.findComponent(ON.id('Slider18'));
      let rect = await slider.getBounds();
      console.info(`rect is: ` + JSON.stringify(rect))
      await driver.click(rect.left, Math.round((rect.top + rect.bottom) / 2))
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('Slider18');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0700] obj1.$attrs.constructor.value is: " +
      JSON.stringify(obj1.$attrs.constructor.value));
      expect(obj1.$attrs.constructor.value).assertEqual('0.000000');
      done();
    });

    /*
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0710
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0710
     * @tc.desc        click block，End 2
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0710', 3, async (done: Function) => {
      await routerPush("slider19")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let slider = await driver.findComponent(ON.id('Slider19'));
      let rect = await slider.getBounds();
      console.info(`rect is: ` + JSON.stringify(rect))
      await driver.click(rect.left, Math.round((rect.top + rect.bottom) / 2))
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('Slider19');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0710] obj1.$attrs.constructor.value is: " +
      JSON.stringify(obj1.$attrs.constructor.value));
      expect(obj1.$attrs.constructor.value).assertEqual('0.000000');
      done();
    });

    /*
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0720
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0720
     * @tc.desc        drag block, Moving 1
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0720', 3, async (done: Function) => {
      await routerPush("slider20")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let slider = await driver.findComponent(ON.id('Slider20'));
      let rect = await slider.getBounds();
      await Utils.sleep(1000);
      console.info(`rect is: ` + JSON.stringify(rect))
      await driver.drag(rect.left, Math.round((rect.top + rect.bottom) / 2),
        rect.left + Math.round((rect.right - rect.left) / 4), Math.round((rect.top + rect.bottom) / 2), 600)
      console.info(`drag is: ` + rect.left, Math.round((rect.top + rect.bottom) / 2),
        rect.left + Math.round((rect.right - rect.left) / 4), Math.round((rect.top + rect.bottom) / 2), 600)
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('Slider20');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0720] obj1.$attrs.constructor.value is: " +
      JSON.stringify(obj1.$attrs.constructor.value));
      expect(obj1.$attrs.constructor.value).assertEqual('20.000000');
      done();
    });

    /*
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0730
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0730
     * @tc.desc        click, Click 3
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0730', 3, async (done: Function) => {
      await routerPush("slider20")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let slider = await driver.findComponent(ON.id('Slider20'));
      let rect = await slider.getBounds();
      console.info(`rect is: ` + JSON.stringify(rect))
      await Utils.sleep(1000);
      await driver.click(rect.left + Math.round((rect.right - rect.left) / 4), Math.round((rect.top + rect.bottom) / 2))
      console.info(`click is: ` + rect.left + Math.round((rect.right - rect.left) / 4),
        Math.round((rect.top + rect.bottom) / 2))
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('Slider20');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0730] obj1.$attrs.constructor.value is: " +
      JSON.stringify(obj1.$attrs.constructor.value));
      expect(obj1.$attrs.constructor.value).assertEqual('20.000000');
      done();
    });

    /*
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_1080
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_1080
     * @tc.desc        set blockStyle img , drag block
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_1080', 3, async (done: Function) => {
      await routerPush("slider21")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let slider = await driver.findComponent(ON.id('Slider21'));
      let rect = await slider.getBounds();
      console.info(`rect is: ` + JSON.stringify(rect))
      await Utils.sleep(1000);
      await driver.drag(rect.left, Math.round((rect.top + rect.bottom) / 2),
        rect.left + Math.round((rect.right - rect.left) / 4), Math.round((rect.top + rect.bottom) / 2), 600)
      console.info(`drag is: ` + rect.left, Math.round((rect.top + rect.bottom) / 2),
        rect.left + Math.round((rect.right - rect.left) / 4), Math.round((rect.top + rect.bottom) / 2), 600)
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('Slider21');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_1080] obj1.$attrs.constructor.value is: " +
      JSON.stringify(obj1.$attrs.constructor.value));
      expect(obj1.$attrs.constructor.value).assertEqual('20.000000');
      done();
    });

    /*
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_LAYOUT_0010
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_LAYOUT_0010
     * @tc.desc        width 300 height 300
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_LAYOUT_0010', 3, async (done: Function) => {
      await routerPush("slider22")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('Slider22');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_LAYOUT_0010] obj1.$attrs.width is: " +
      JSON.stringify(obj1.$attrs.width));
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_LAYOUT_0010] obj1.$attrs.height is: " +
      JSON.stringify(obj1.$attrs.height));
      expect(obj1.$attrs.width).assertEqual('300.00vp');
      expect(obj1.$attrs.height).assertEqual('300.00vp');
      done();
    });

    /*
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_LAYOUT_0020
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_LAYOUT_0020
     * @tc.desc        trackThickness = 60
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_LAYOUT_0020', 3, async (done: Function) => {
      await routerPush("slider23")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('Slider23');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_LAYOUT_0020] obj1.$attrs.height is: " +
      JSON.stringify(obj1.$attrs.height));
      expect(obj1.$attrs.height).assertEqual('60.00vp');
      done();
    });
  })
}
