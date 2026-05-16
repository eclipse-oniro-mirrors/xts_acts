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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation,
  ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import Utils from '../../../ets/MainAbility/common/Utils';
import {UtilsTest,startAbility} from '../Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';

export default function MultiSegmentButtonV2PageTest() {
  describe('MultiSegmentButtonV2PageTest', () => {
    beforeAll(() => {
      console.info("MultiSegmentButtonV2PageTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.advanced.component.nowear.api18.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("MultiSegmentButtonV2PageTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/multiCapsuleSegmentButtonV2/MultiSegmentButtonV2Page",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get MultiSegmentButtonV2PageTest state pages:" + JSON.stringify(pages));
        if (!("MultiSegmentButtonV2Page" == pages.name)) {
          console.info("get MultiSegmentButtonV2PageTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push MultiSegmentButtonV2PageTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push MultiSegmentButtonV2PageTest page error:" + err);
      }
      console.info("MultiSegmentButtonV2PageTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("MultiSegmentButtonV2PageTest after each called");
    });

    
    
    
    /**
     * @tc.number   MultiSegmentButtonV2PageTest_static_001
     * @tc.name     MultiSegmentButtonV2PageTest_static_001
     * @tc.desc     MultiSegmentButtonV2PageTest_static_001
     * @tc.level    Level.LEVEL0
     */
it('MultiSegmentButtonV2PageTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("[MultiSegmentButtonV2PageTest_static_001] START");
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('SelectedIndexesId001'));
      await (button?.click() as Promise<void>);
      await driver.delayMs(1000);

      let textJ = inspector.getInspectorByKey('selectedIndexesTest001');
      let text = JSON.parseJsonElement(textJ);

      expect(text.getElement('$attrs').getString('content')).assertEqual('0');
      console.log("[MultiSegmentButtonV2PageTest_static_001] END");
      done();
    })

    
    
    
    /**
     * @tc.number   MultiSegmentButtonV2PageTest_static_002
     * @tc.name     MultiSegmentButtonV2PageTest_static_002
     * @tc.desc     MultiSegmentButtonV2PageTest_static_002
     * @tc.level    Level.LEVEL0
     */
it('MultiSegmentButtonV2PageTest_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("[MultiSegmentButtonV2PageTest_static_002] START");
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('SelectedIndexesId002'));
      await (button?.click() as Promise<void>);
      await driver.delayMs(1000);

      let textJ = inspector.getInspectorByKey('selectedIndexesTest001');
      let text = JSON.parseJsonElement(textJ);

      expect(text.getElement('$attrs').getString('content')).assertEqual('1');
      console.log("[MultiSegmentButtonV2PageTest_static_002] END");
      done();
    })

    
    
    
    /**
     * @tc.number   MultiSegmentButtonV2PageTest_static_003
     * @tc.name     MultiSegmentButtonV2PageTest_static_003
     * @tc.desc     MultiSegmentButtonV2PageTest_static_003
     * @tc.level    Level.LEVEL0
     */
it('MultiSegmentButtonV2PageTest_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("[MultiSegmentButtonV2PageTest_static_003] START");
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('SelectedIndexesId003'));
      await (button?.click() as Promise<void>);
      await driver.delayMs(1000);

      let textJ = inspector.getInspectorByKey('selectedIndexesTest001');
      let text = JSON.parseJsonElement(textJ);

      expect(text.getElement('$attrs').getString('content')).assertEqual('2');
      console.log("[MultiSegmentButtonV2PageTest_static_003] END");
      done();
    })

    
    
    
    /**
     * @tc.number   MultiSegmentButtonV2PageTest_static_004
     * @tc.name     MultiSegmentButtonV2PageTest_static_004
     * @tc.desc     MultiSegmentButtonV2PageTest_static_004
     * @tc.level    Level.LEVEL0
     */
it('MultiSegmentButtonV2PageTest_static_004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("[MultiSegmentButtonV2PageTest_static_004] START");
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('SelectedIndexesId004'));
      await (button?.click() as Promise<void>);
      await driver.delayMs(1000);

      let textJ = inspector.getInspectorByKey('selectedIndexesTest001');
      let text = JSON.parseJsonElement(textJ);

      expect(text.getElement('$attrs').getString('content')).assertEqual('3');

      const button5 = await driver.findComponent(ON.id('SelectedIndexesId005'));
      await (button5?.click() as Promise<void>);
      await driver.delayMs(1000);
      console.log("[MultiSegmentButtonV2PageTest_static_004] END");
      done();
    })

    
    
    
    /**
     * @tc.number   MultiSegmentButtonV2PageTest_static_005
     * @tc.name     MultiSegmentButtonV2PageTest_static_005
     * @tc.desc     MultiSegmentButtonV2PageTest_static_005
     * @tc.level    Level.LEVEL0
     */
it('MultiSegmentButtonV2PageTest_static_005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("[MultiSegmentButtonV2PageTest_static_005] START");
      const driver = Driver.create();
      let segmentItem = await driver.findComponent(ON.text("a"));
      await (segmentItem?.click() as Promise<void>);
      await driver.delayMs(1000);

      let textJ = inspector.getInspectorByKey('selectedIndexesTest001');
      let text = JSON.parseJsonElement(textJ);

      expect(text.getElement('$attrs').getString('content')).assertEqual('0');
      console.log("[MultiSegmentButtonV2PageTest_static_005] END");
      done();
    })

    
    
    
    /**
     * @tc.number   MultiSegmentButtonV2PageTest_static_006
     * @tc.name     MultiSegmentButtonV2PageTest_static_006
     * @tc.desc     MultiSegmentButtonV2PageTest_static_006
     * @tc.level    Level.LEVEL0
     */
it('MultiSegmentButtonV2PageTest_static_006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("[MultiSegmentButtonV2PageTest_static_006] START");
      const driver = Driver.create();
      let segmentItem = await driver.findComponent(ON.text("b"));
      await (segmentItem?.click() as Promise<void>);
      await driver.delayMs(1000);

      let textJ = inspector.getInspectorByKey('selectedIndexesTest001');
      let text = JSON.parseJsonElement(textJ);

      expect(text.getElement('$attrs').getString('content')).assertEqual('0,1');
      console.log("[MultiSegmentButtonV2PageTest_static_006] END");
      done();
    })

    
    
    
    /**
     * @tc.number   MultiSegmentButtonV2PageTest_static_007
     * @tc.name     MultiSegmentButtonV2PageTest_static_007
     * @tc.desc     MultiSegmentButtonV2PageTest_static_007
     * @tc.level    Level.LEVEL0
     */
it('MultiSegmentButtonV2PageTest_static_007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("[MultiSegmentButtonV2PageTest_static_007] START");
      const driver = Driver.create();
      let segmentItem = await driver.findComponent(ON.text("c"));
      await (segmentItem?.click() as Promise<void>);
      await driver.delayMs(1000);

      let textJ = inspector.getInspectorByKey('selectedIndexesTest001');
      let text = JSON.parseJsonElement(textJ);

      expect(text.getElement('$attrs').getString('content')).assertEqual('0,1,2');
      console.log("[MultiSegmentButtonV2PageTest_static_007] END");
      done();
    })

    
    
    
    /**
     * @tc.number   MultiSegmentButtonV2PageTest_static_008
     * @tc.name     MultiSegmentButtonV2PageTest_static_008
     * @tc.desc     MultiSegmentButtonV2PageTest_static_008
     * @tc.level    Level.LEVEL0
     */
it('MultiSegmentButtonV2PageTest_static_008', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("[MultiSegmentButtonV2PageTest_static_008] START");
      const driver = Driver.create();
      let segmentItem = await driver.findComponent(ON.text("d"));
      await (segmentItem?.click() as Promise<void>);
      await driver.delayMs(1000);

      let textJ = inspector.getInspectorByKey('selectedIndexesTest001');
      let text = JSON.parseJsonElement(textJ);

      expect(text.getElement('$attrs').getString('content')).assertEqual('0,1,2,3');
      console.log("[MultiSegmentButtonV2PageTest_static_008] END");
      done();
    })

    
    
    
    /**
     * @tc.number   MultiSegmentButtonV2PageTest_static_009
     * @tc.name     MultiSegmentButtonV2PageTest_static_009
     * @tc.desc     MultiSegmentButtonV2PageTest_static_009
     * @tc.level    Level.LEVEL0
     */
it('MultiSegmentButtonV2PageTest_static_009', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("[MultiSegmentButtonV2PageTest_static_009] START");
      const driver = Driver.create();
      await driver.delayMs(1000);

      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let scroll = tree.getArray("$children")[0];
      let column = scroll.getArray("$children")[0];
      let common = column.getArray("$children")[3];
      let flex = common.getArray("$children")[0];
      let itemBtn0 = flex.getArray("$children")[1];

      expect(itemBtn0.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFF0000');
      console.log("[MultiSegmentButtonV2PageTest_static_009] END");
      done();
    })

    
    
    
    /**
     * @tc.number   MultiSegmentButtonV2PageTest_static_010
     * @tc.name     MultiSegmentButtonV2PageTest_static_010
     * @tc.desc     MultiSegmentButtonV2PageTest_static_010
     * @tc.level    Level.LEVEL0
     */
it('MultiSegmentButtonV2PageTest_static_010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("[MultiSegmentButtonV2PageTest_static_010] START");
      const driver = Driver.create();
      await driver.delayMs(1000);

      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let scroll = tree.getArray("$children")[0];
      let column = scroll.getArray("$children")[0];
      let common = column.getArray("$children")[1];
      let flex = common.getArray("$children")[0];
      let itemBtn0 = flex.getArray("$children")[0];

      let jsonOption: string = JSON.stringify(itemBtn0.getElement('$attrs').getString('backgroundEffect'));

      expect(jsonOption)
        .assertEqual('{"options":{"radius":10,"saturation":25,"brightness":1.5,"color":"#FFFF00FF","adaptiveColor":"AdaptiveColor.Average","policy":"BlurStyleActivePolicy.ALWAYS_INACTIVE","type":"WITHIN_WINDOW","inactiveColor":"#FF0000FF","blurOption":"[20.000000,40.000000]"}}');
      console.log("[MultiSegmentButtonV2PageTest_static_010] END");
      done();
    })

    
    
    
    /**
     * @tc.number   MultiSegmentButtonV2PageTest_static_011
     * @tc.name     MultiSegmentButtonV2PageTest_static_011
     * @tc.desc     MultiSegmentButtonV2PageTest_static_011
     * @tc.level    Level.LEVEL0
     */
it('MultiSegmentButtonV2PageTest_static_011', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("[MultiSegmentButtonV2PageTest_static_011] START");
      const driver = Driver.create();
      await driver.delayMs(1000);

      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let scroll = tree.getArray("$children")[0];
      let column = scroll.getArray("$children")[0];
      let common = column.getArray("$children")[3];
      let flex = common.getArray("$children")[0];
      let itemBtn0 = flex.getArray("$children")[0];
      let common1 = itemBtn0.getArray("$children")[0];

      let blurStyle = JSON.stringify(common1.getElement('$attrs').getElement('backgroundBlurStyle').getString('value'));
      expect(blurStyle).assertEqual('"BlurStyle.Thin"');
      let jsonOption: string = JSON.stringify(common1.getElement('$attrs').getString('backgroundBlurStyle'));

      expect(jsonOption)
        .assertEqual('{"value":"BlurStyle.Thin","options":{"colorMode":"ThemeColorMode.System","adaptiveColor":"AdaptiveColor.Default","policy":"BlurStyleActivePolicy.ALWAYS_INACTIVE","type":"BlurType.WITHIN_WINDOW","inactiveColor":"#FFCCCCCC","scale":1}}');
      console.log("[MultiSegmentButtonV2PageTest_static_011] END");
      done();
    })

    
    
    
    /**
     * @tc.number   MultiSegmentButtonV2PageTest_static_012
     * @tc.name     MultiSegmentButtonV2PageTest_static_012
     * @tc.desc     MultiSegmentButtonV2PageTest_static_012
     * @tc.level    Level.LEVEL0
     */
it('MultiSegmentButtonV2PageTest_static_012', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("[MultiSegmentButtonV2PageTest_static_012] START");
      const driver = Driver.create();
      await driver.delayMs(1000);

      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let scroll = tree.getArray("$children")[0];
      let column = scroll.getArray("$children")[0];
      let common = column.getArray("$children")[3];
      let flex = common.getArray("$children")[0];
      let itemBtn0 = flex.getArray("$children")[0];
      let common1 = itemBtn0.getArray("$children")[0];
      let jsonOption: string = JSON.stringify(common1.getElement('$attrs').getString('backgroundBlurStyle'));

      expect(jsonOption)
        .assertEqual('{"value":"BlurStyle.Thin","options":{"colorMode":"ThemeColorMode.System","adaptiveColor":"AdaptiveColor.Default","policy":"BlurStyleActivePolicy.ALWAYS_INACTIVE","type":"BlurType.WITHIN_WINDOW","inactiveColor":"#FFCCCCCC","scale":1}}');
      console.log("[MultiSegmentButtonV2PageTest_static_012] END");
      done();
    })

    
    
    
    /**
     * @tc.number   MultiSegmentButtonV2PageTest_static_015
     * @tc.name     MultiSegmentButtonV2PageTest_static_015
     * @tc.desc     MultiSegmentButtonV2PageTest_static_015
     * @tc.level    Level.LEVEL0
     */
it('MultiSegmentButtonV2PageTest_static_015', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("[MultiSegmentButtonV2PageTest_022] START");
      const driver = Driver.create();
      await driver.delayMs(1000);

      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let scroll = tree.getArray("$children")[0];
      let column = scroll.getArray("$children")[0];
      let common = column.getArray("$children")[3];
      let flex = common.getArray("$children")[0];
      let itemBtn0 = flex.getArray("$children")[0];
      let common1 = itemBtn0.getArray("$children")[0];
      let jsonOption: string = JSON.stringify(common1.getElement('$attrs').getString('direction'));
      expect(jsonOption).assertEqual('"Direction.Auto"');
      console.log("[MultiSegmentButtonV2PageTest_static_015] END");
      done();
    })

    
    
    
    /**
     * @tc.number   MultiSegmentButtonV2PageTest_static_016
     * @tc.name     MultiSegmentButtonV2PageTest_static_016
     * @tc.desc     MultiSegmentButtonV2PageTest_static_016
     * @tc.level    Level.LEVEL0
     */
it('MultiSegmentButtonV2PageTest_static_016', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("[MultiSegmentButtonV2PageTest_static_016] START");
      const driver = Driver.create();
      await driver.delayMs(1000);

      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let scroll = tree.getArray("$children")[0];
      let column = scroll.getArray("$children")[0];
      let common = column.getArray("$children")[3];
      let flex = common.getArray("$children")[0];
      let itemBtn0 = flex.getArray("$children")[1];
      let jsonOption: string = JSON.stringify(itemBtn0.getElement('$attrs').getString('fontColor'));

      expect(jsonOption).assertEqual('"#FF000000"');
      console.log("[MultiSegmentButtonV2PageTest_static_016] END");
      done();
    })

    
    
    
    /**
     * @tc.number   MultiSegmentButtonV2PageTest_static_017
     * @tc.name     MultiSegmentButtonV2PageTest_static_017
     * @tc.desc     MultiSegmentButtonV2PageTest_static_017
     * @tc.level    Level.LEVEL0
     */
it('MultiSegmentButtonV2PageTest_static_017', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("[MultiSegmentButtonV2PageTest_static_017] START");
      const driver = Driver.create();
      await driver.delayMs(1000);

      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let scroll = tree.getArray("$children")[0];
      let column = scroll.getArray("$children")[0];
      let common = column.getArray("$children")[1];
      let flex = common.getArray("$children")[0];
      let itemBtn0 = flex.getArray("$children")[0];
      let jsonOption: string = JSON.stringify(itemBtn0.getElement('$attrs').getString('fontSize'));

      expect(jsonOption).assertEqual('"0.00px"');
      console.log("[MultiSegmentButtonV2PageTest_static_017] END");
      done();
    })

    
    
    
    /**
     * @tc.number   MultiSegmentButtonV2PageTest_static_018
     * @tc.name     MultiSegmentButtonV2PageTest_static_018
     * @tc.desc     MultiSegmentButtonV2PageTest_static_018
     * @tc.level    Level.LEVEL0
     */
it('MultiSegmentButtonV2PageTest_static_018', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("[MultiSegmentButtonV2PageTest_static_018] START");
      const driver = Driver.create();
      await driver.delayMs(1000);

      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let scroll = tree.getArray("$children")[0];
      let column = scroll.getArray("$children")[0];
      let common = column.getArray("$children")[3];
      let flex = common.getArray("$children")[0];
      let itemBtn0 = flex.getArray("$children")[1];
      let jsonOption: string = JSON.stringify(itemBtn0.getElement('$attrs').getString('fontWeight'));

      expect(jsonOption).assertEqual('"FontWeight.Medium"');
      console.log("[MultiSegmentButtonV2PageTest_static_018] END");
      done();
    })

    
    
    
    /**
     * @tc.number   MultiSegmentButtonV2PageTest_static_019
     * @tc.name     MultiSegmentButtonV2PageTest_static_019
     * @tc.desc     MultiSegmentButtonV2PageTest_static_019
     * @tc.level    Level.LEVEL0
     */
it('MultiSegmentButtonV2PageTest_static_019', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("[MultiSegmentButtonV2PageTest_static_019] START");
      const driver = Driver.create();
      await driver.delayMs(1000);

      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let scroll = tree.getArray("$children")[0];
      let column = scroll.getArray("$children")[0];
      let common = column.getArray("$children")[3];
      let flex = common.getArray("$children")[0];
      let itemBtn0 = flex.getArray("$children")[0];
      let common1 = itemBtn0.getArray("$children")[0];
      let jsonOption: string = JSON.stringify(common1.getElement('$attrs').getString('padding'));

      expect(jsonOption).assertEqual('"0.00vp"');
      console.log("[MultiSegmentButtonV2PageTest_static_019] END");
      done();
    })
  })
}