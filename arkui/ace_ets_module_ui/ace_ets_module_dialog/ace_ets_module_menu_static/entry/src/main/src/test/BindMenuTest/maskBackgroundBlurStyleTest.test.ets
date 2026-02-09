'use static'
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from "../../../../hypium/index";
import router from '@ohos.router';
import drawing from '@ohos.graphics.drawing';
import {
  Component,
  Driver,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  PointerMatrix} from '@ohos.UiTest';
import { EnterKeyType } from '@ohos.arkui.component'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { UtilsTest } from '../Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter'
import { BusinessError } from '@ohos.base';
import Utils from '../../../ets/MainAbility/common/Utils';

export default function maskBackgroundBlurStyleTest() {
  describe('maskBackgroundBlurStyleTest', () => {
    beforeAll(() => {
      console.info("maskBackgroundBlurStyleTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.menu.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("maskBackgroundBlurStyleTest beforeEach start");
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get maskBackgroundBlurStyleTest state pages:" + JSON.stringify(pages));
        if (!("maskBackgroundBlurStyle" == pages.name)) {
          console.info("get maskBackgroundBlurStyleTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl({
            url: 'MainAbility/pages/bindMenu/maskBackgroundBlurStyle',
          })
        }
      } catch (err) {
        console.error("push maskBackgroundBlurStyleTest page error:" + err);
      }
      console.info("maskBackgroundBlurStyleTest foreEach end");
    });
    /**
     * @tc.number maskBackgroundBlurStyleTest_static_0001
     * @tc.name   maskBackgroundBlurStyleTest_static_0001
     * @tc.desc   maskBackgroundBlurStyleTest_static_0001
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  @tc.level   TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('maskBackgroundBlurStyleTest_static_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('maskBackgroundBlurStyleButton1'));
      await (btn?.click() as Promise<void>);
      await Utils.sleep(1000);
      let resource = inspector.getInspectorByKey('maskBlurResource');
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await Utils.sleep(2000);
      let date = obj.getElement('$children')[1].getElement('$children')[0];
      let type = JSON.parseJsonElement(resource).getElement('$attrs').getString('content');
      if (type === 'true') {
        expect(date
          .getElement('$attrs')
          .getElement('mask')
          .getString('mask')).assertEqual('true');
        expect(date
          .getElement('$attrs')
          .getElement('mask')
          .getElement('backgroundBlurStyle')
          .getString('value')).assertEqual('BlurStyle.Thin');
      } else {
        expect(date
          .getElement('$attrs')
          .getElement('mask')
          .getString('mask')).assertEqual('false');
      }
      let btn1 = await driver.findComponent(ON.id('maskBackgroundBlurStyleClose'));
      await (btn1?.click() as Promise<void>);
      await Utils.sleep(1000);
      done();
    });
    /**
     * @tc.number maskBackgroundBlurStyleTest_static_0002
     * @tc.name   maskBackgroundBlurStyleTest_static_0002
     * @tc.desc   maskBackgroundBlurStyleTest_static_0002
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  @tc.level   TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('maskBackgroundBlurStyleTest_static_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('maskBackgroundBlurStyleButton2'));
      await (btn?.click() as Promise<void>);
      await Utils.sleep(1000);
      let resource = inspector.getInspectorByKey('maskBlurResource');
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await Utils.sleep(2000);
      let date = obj.getElement('$children')[1].getElement('$children')[0];
      let type = JSON.parseJsonElement(resource).getElement('$attrs').getString('content');
      if (type === 'true') {
        expect(date
          .getElement('$attrs')
          .getElement('mask')
          .getString('mask')).assertEqual('true');
        expect(date
          .getElement('$attrs')
          .getElement('mask')
          .getElement('backgroundBlurStyle')
          .getString('value')).assertEqual('BlurStyle.Regular');
      } else {
        expect(date
          .getElement('$attrs')
          .getElement('mask')
          .getString('mask')).assertEqual('false');
      }
      let btn1 = await driver.findComponent(ON.id('maskBackgroundBlurStyleClose'));
      await (btn1?.click() as Promise<void>);
      await Utils.sleep(1000);
      done();
    });
    /**
     * @tc.number maskBackgroundBlurStyleTest_static_0003
     * @tc.name   maskBackgroundBlurStyleTest_static_0003
     * @tc.desc   maskBackgroundBlurStyleTest_static_0003
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  @tc.level   TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('maskBackgroundBlurStyleTest_static_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('maskBackgroundBlurStyleButton3'));
      await (btn?.click() as Promise<void>);
      await Utils.sleep(1000);
      let resource = inspector.getInspectorByKey('maskBlurResource');
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await Utils.sleep(2000);
      let date = obj.getElement('$children')[1].getElement('$children')[0];
      let type = JSON.parseJsonElement(resource).getElement('$attrs').getString('content');
      if (type === 'true') {
        expect(date
          .getElement('$attrs')
          .getElement('mask')
          .getString('mask')).assertEqual('true');
        expect(date
          .getElement('$attrs')
          .getElement('mask')
          .getElement('backgroundBlurStyle')
          .getString('value')).assertEqual('BlurStyle.Thick');
      } else {
        expect(date
          .getElement('$attrs')
          .getElement('mask')
          .getString('mask')).assertEqual('false');
      }
      let btn1 = await driver.findComponent(ON.id('maskBackgroundBlurStyleClose'));
      await (btn1?.click() as Promise<void>);
      await Utils.sleep(1000);
      done();
    });
    /**
     * @tc.number maskBackgroundBlurStyleTest_static_0004
     * @tc.name   maskBackgroundBlurStyleTest_static_0004
     * @tc.desc   maskBackgroundBlurStyleTest_static_0004
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  @tc.level   TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('maskBackgroundBlurStyleTest_static_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('maskBackgroundBlurStyleButton4'));
      await (btn?.click() as Promise<void>);
      await Utils.sleep(1000);
      let resource = inspector.getInspectorByKey('maskBlurResource');
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await Utils.sleep(2000);
      let date = obj.getElement('$children')[1].getElement('$children')[0];
      let type = JSON.parseJsonElement(resource).getElement('$attrs').getString('content');
      if (type === 'true') {
        expect(date
          .getElement('$attrs')
          .getElement('mask')
          .getString('mask')).assertEqual('true');
        expect(date
          .getElement('$attrs')
          .getElement('mask')
          .getElement('backgroundBlurStyle')
          .getString('value')).assertEqual('BlurStyle.BACKGROUND_THIN');
      } else {
        expect(date
          .getElement('$attrs')
          .getElement('mask')
          .getString('mask')).assertEqual('false');
      }
      let btn1 = await driver.findComponent(ON.id('maskBackgroundBlurStyleClose'));
      await (btn1?.click() as Promise<void>);
      await Utils.sleep(1000);
      done();
    });
    /**
     * @tc.number maskBackgroundBlurStyleTest_static_0005
     * @tc.name   maskBackgroundBlurStyleTest_static_0005
     * @tc.desc   maskBackgroundBlurStyleTest_static_0005
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  @tc.level   TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('maskBackgroundBlurStyleTest_static_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('maskBackgroundBlurStyleButton5'));
      await (btn?.click() as Promise<void>);
      await Utils.sleep(1000);
      let resource = inspector.getInspectorByKey('maskBlurResource');
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await Utils.sleep(2000);
      let date = obj.getElement('$children')[1].getElement('$children')[0];
      let type = JSON.parseJsonElement(resource).getElement('$attrs').getString('content');
      if (type === 'true') {
        expect(date
          .getElement('$attrs')
          .getElement('mask')
          .getString('mask')).assertEqual('true');
        expect(date
          .getElement('$attrs')
          .getElement('mask')
          .getElement('backgroundBlurStyle')
          .getString('value')).assertEqual('BlurStyle.BACKGROUND_REGULAR');
      } else {
        expect(date
          .getElement('$attrs')
          .getElement('mask')
          .getString('mask')).assertEqual('false');
      }
      let btn1 = await driver.findComponent(ON.id('maskBackgroundBlurStyleClose'));
      await (btn1?.click() as Promise<void>);
      await Utils.sleep(1000);
      done();
    });
    /**
     * @tc.number maskBackgroundBlurStyleTest_static_0006
     * @tc.name   maskBackgroundBlurStyleTest_static_0006
     * @tc.desc   maskBackgroundBlurStyleTest_static_0006
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  @tc.level   TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('maskBackgroundBlurStyleTest_static_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('maskBackgroundBlurStyleButton6'));
      await (btn?.click() as Promise<void>);
      await Utils.sleep(1000);
      let resource = inspector.getInspectorByKey('maskBlurResource');
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await Utils.sleep(2000);
      let date = obj.getElement('$children')[1].getElement('$children')[0];
      let type = JSON.parseJsonElement(resource).getElement('$attrs').getString('content');
      if (type === 'true') {
        expect(date
          .getElement('$attrs')
          .getElement('mask')
          .getString('mask')).assertEqual('true');
        expect(date
          .getElement('$attrs')
          .getElement('mask')
          .getElement('backgroundBlurStyle')
          .getString('value')).assertEqual('BlurStyle.BACKGROUND_THICK');
      } else {
        expect(date
          .getElement('$attrs')
          .getElement('mask')
          .getString('mask')).assertEqual('false');
      }
      let btn1 = await driver.findComponent(ON.id('maskBackgroundBlurStyleClose'));
      await (btn1?.click() as Promise<void>);
      await Utils.sleep(1000);
      done();
    });
    /**
     * @tc.number maskBackgroundBlurStyleTest_static_0007
     * @tc.name   maskBackgroundBlurStyleTest_static_0007
     * @tc.desc   maskBackgroundBlurStyleTest_static_0007
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  @tc.level   TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('maskBackgroundBlurStyleTest_static_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('maskBackgroundBlurStyleButton7'));
      await (btn?.click() as Promise<void>);
      await Utils.sleep(1000);
      let resource = inspector.getInspectorByKey('maskBlurResource');
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await Utils.sleep(2000);
      let date = obj.getElement('$children')[1].getElement('$children')[0];
      let type = JSON.parseJsonElement(resource).getElement('$attrs').getString('content');
      if (type === 'true') {
        expect(date
          .getElement('$attrs')
          .getElement('mask')
          .getString('mask')).assertEqual('true');
        expect(date
          .getElement('$attrs')
          .getElement('mask')
          .getElement('backgroundBlurStyle')
          .getString('value')).assertEqual('BlurStyle.BACKGROUND_ULTRA_THICK');
      } else {
        expect(date
          .getElement('$attrs')
          .getElement('mask')
          .getString('mask')).assertEqual('false');
      }
      let btn1 = await driver.findComponent(ON.id('maskBackgroundBlurStyleClose'));
      await (btn1?.click() as Promise<void>);
      await Utils.sleep(1000);
      done();
    });
    /**
     * @tc.number maskBackgroundBlurStyleTest_static_0008
     * @tc.name   maskBackgroundBlurStyleTest_static_0008
     * @tc.desc   maskBackgroundBlurStyleTest_static_0008
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  @tc.level   TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('maskBackgroundBlurStyleTest_static_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('maskBackgroundBlurStyleButton8'));
      await (btn?.click() as Promise<void>);
      await Utils.sleep(1000);
      let resource = inspector.getInspectorByKey('maskBlurResource');
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await Utils.sleep(2000);
      let date = obj.getElement('$children')[1].getElement('$children')[0];
      let type = JSON.parseJsonElement(resource).getElement('$attrs').getString('content');
      if (type === 'true') {
        expect(date
          .getElement('$attrs')
          .getElement('mask')
          .getString('mask')).assertEqual('true');
        expect(date
          .getElement('$attrs')
          .getElement('mask')
          .getElement('backgroundBlurStyle')
          .getString('value')).assertEqual('BlurStyle.NONE');
      } else {
        expect(date
          .getElement('$attrs')
          .getElement('mask')
          .getString('mask')).assertEqual('false');
      }
      let btn1 = await driver.findComponent(ON.id('maskBackgroundBlurStyleClose'));
      await (btn1?.click() as Promise<void>);
      await Utils.sleep(1000);
      done();
    });
    /**
     * @tc.number maskBackgroundBlurStyleTest_static_0009
     * @tc.name   maskBackgroundBlurStyleTest_static_0009
     * @tc.desc   maskBackgroundBlurStyleTest_static_0009
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  @tc.level   TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('maskBackgroundBlurStyleTest_static_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('maskBackgroundBlurStyleButton9'));
      await (btn?.click() as Promise<void>);
      await Utils.sleep(1000);
      let resource = inspector.getInspectorByKey('maskBlurResource');
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await Utils.sleep(2000);
      let date = obj.getElement('$children')[1].getElement('$children')[0];
      let type = JSON.parseJsonElement(resource).getElement('$attrs').getString('content');
      if (type === 'true') {
        expect(date
          .getElement('$attrs')
          .getElement('mask')
          .getString('mask')).assertEqual('true');
        expect(date
          .getElement('$attrs')
          .getElement('mask')
          .getElement('backgroundBlurStyle')
          .getString('value')).assertEqual('BlurStyle.COMPONENT_ULTRA_THIN');
      } else {
        expect(date
          .getElement('$attrs')
          .getElement('mask')
          .getString('mask')).assertEqual('false');
      }
      let btn1 = await driver.findComponent(ON.id('maskBackgroundBlurStyleClose'));
      await (btn1?.click() as Promise<void>);
      await Utils.sleep(1000);
      done();
    });
    /**
     * @tc.number maskBackgroundBlurStyleTest_static_0010
     * @tc.name   maskBackgroundBlurStyleTest_static_0010
     * @tc.desc   maskBackgroundBlurStyleTest_static_0010
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  @tc.level   TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('maskBackgroundBlurStyleTest_static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('maskBackgroundBlurStyleButton10'));
      await (btn?.click() as Promise<void>);
      await Utils.sleep(1000);
      let resource = inspector.getInspectorByKey('maskBlurResource');
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await Utils.sleep(2000);
      let date = obj.getElement('$children')[1].getElement('$children')[0];
      let type = JSON.parseJsonElement(resource).getElement('$attrs').getString('content');
      if (type === 'true') {
        expect(date
          .getElement('$attrs')
          .getElement('mask')
          .getString('mask')).assertEqual('true');
        expect(date
          .getElement('$attrs')
          .getElement('mask')
          .getElement('backgroundBlurStyle')
          .getString('value')).assertEqual('BlurStyle.COMPONENT_THIN');
      } else {
        expect(date
          .getElement('$attrs')
          .getElement('mask')
          .getString('mask')).assertEqual('false');
      }
      let btn1 = await driver.findComponent(ON.id('maskBackgroundBlurStyleClose'));
      await (btn1?.click() as Promise<void>);
      await Utils.sleep(1000);
      done();
    });
    /**
     * @tc.number maskBackgroundBlurStyleTest_static_0011
     * @tc.name   maskBackgroundBlurStyleTest_static_0011
     * @tc.desc   maskBackgroundBlurStyleTest_static_0011
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  @tc.level   TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('maskBackgroundBlurStyleTest_static_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('maskBackgroundBlurStyleButton11'));
      await (btn?.click() as Promise<void>);
      await Utils.sleep(1000);
      let resource = inspector.getInspectorByKey('maskBlurResource');
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await Utils.sleep(2000);
      let date = obj.getElement('$children')[1].getElement('$children')[0];
      let type = JSON.parseJsonElement(resource).getElement('$attrs').getString('content');
      if (type === 'true') {
        expect(date
          .getElement('$attrs')
          .getElement('mask')
          .getString('mask')).assertEqual('true');
        expect(date
          .getElement('$attrs')
          .getElement('mask')
          .getElement('backgroundBlurStyle')
          .getString('value')).assertEqual('BlurStyle.COMPONENT_REGULAR');
      } else {
        expect(date
          .getElement('$attrs')
          .getElement('mask')
          .getString('mask')).assertEqual('false');
      }
      let btn1 = await driver.findComponent(ON.id('maskBackgroundBlurStyleClose'));
      await (btn1?.click() as Promise<void>);
      await Utils.sleep(1000);
      done();
    });
    /**
     * @tc.number maskBackgroundBlurStyleTest_static_0012
     * @tc.name   maskBackgroundBlurStyleTest_static_0012
     * @tc.desc   maskBackgroundBlurStyleTest_static_0012
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  @tc.level   TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('maskBackgroundBlurStyleTest_static_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('maskBackgroundBlurStyleButton12'));
      await (btn?.click() as Promise<void>);
      await Utils.sleep(1000);
      let resource = inspector.getInspectorByKey('maskBlurResource');
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await Utils.sleep(2000);
      let date = obj.getElement('$children')[1].getElement('$children')[0];
      let type = JSON.parseJsonElement(resource).getElement('$attrs').getString('content');
      if (type === 'true') {
        expect(date
          .getElement('$attrs')
          .getElement('mask')
          .getString('mask')).assertEqual('true');
        expect(date
          .getElement('$attrs')
          .getElement('mask')
          .getElement('backgroundBlurStyle')
          .getString('value')).assertEqual('BlurStyle.COMPONENT_THICK');
      } else {
        expect(date
          .getElement('$attrs')
          .getElement('mask')
          .getString('mask')).assertEqual('false');
      }
      let btn1 = await driver.findComponent(ON.id('maskBackgroundBlurStyleClose'));
      await (btn1?.click() as Promise<void>);
      await Utils.sleep(1000);
      done();
    });
    /**
     * @tc.number maskBackgroundBlurStyleTest_static_0013
     * @tc.name   maskBackgroundBlurStyleTest_static_0013
     * @tc.desc   maskBackgroundBlurStyleTest_static_0013
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  @tc.level   TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('maskBackgroundBlurStyleTest_static_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('maskBackgroundBlurStyleButton13'));
      await (btn?.click() as Promise<void>);
      await Utils.sleep(1000);
      let resource = inspector.getInspectorByKey('maskBlurResource');
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await Utils.sleep(2000);
      let date = obj.getElement('$children')[1].getElement('$children')[0];
      let type = JSON.parseJsonElement(resource).getElement('$attrs').getString('content');
      if (type === 'true') {
        expect(date
          .getElement('$attrs')
          .getElement('mask')
          .getString('mask')).assertEqual('true');
        expect(date
          .getElement('$attrs')
          .getElement('mask')
          .getElement('backgroundBlurStyle')
          .getString('value')).assertEqual('BlurStyle.COMPONENT_ULTRA_THICK');
      } else {
        expect(date
          .getElement('$attrs')
          .getElement('mask')
          .getString('mask')).assertEqual('false');
      }
      let btn1 = await driver.findComponent(ON.id('maskBackgroundBlurStyleClose'));
      await (btn1?.click() as Promise<void>);
      await Utils.sleep(1000);
      done();
    });
    /**
     * @tc.number maskBackgroundBlurStyleTest_static_0014
     * @tc.name   maskBackgroundBlurStyleTest_static_0014
     * @tc.desc   maskBackgroundBlurStyleTest_static_0014
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  @tc.level   TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('maskBackgroundBlurStyleTest_static_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('maskBackgroundBlurStyleButton14'));
      await (btn?.click() as Promise<void>);
      await Utils.sleep(1000);
      let resource = inspector.getInspectorByKey('maskBlurResource');
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await Utils.sleep(2000);
      let date = obj.getElement('$children')[1].getElement('$children')[0];
      let type = JSON.parseJsonElement(resource).getElement('$attrs').getString('content');
      if (type === 'true') {
        expect(date
          .getElement('$attrs')
          .getElement('mask')
          .getString('mask')).assertEqual('true');
        expect(date
          .getElement('$attrs')
          .getElement('mask')
          .getElement('backgroundBlurStyle')
          .getString('value')).assertEqual('BlurStyle.BACKGROUND_THIN');
      } else {
        expect(date
          .getElement('$attrs')
          .getElement('mask')
          .getString('mask')).assertEqual('false');
      }
      let btn1 = await driver.findComponent(ON.id('maskBackgroundBlurStyleClose'));
      await (btn1?.click() as Promise<void>);
      await Utils.sleep(1000);
      done();
    });
  })
}