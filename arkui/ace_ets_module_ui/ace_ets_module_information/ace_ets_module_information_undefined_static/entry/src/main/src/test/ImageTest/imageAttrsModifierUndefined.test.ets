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
import events_emitter from '@ohos.events.emitter';
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';

export default function ImageAttrsModifierUndefinedTest() {
  describe('ImageAttrsModifierUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("ImageAttrsModifierUndefinedTest beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.information.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("ImageAttrsModifierUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Image/imageAttrsModifierUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get ImageAttrsModifierUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("imageAttrsModifierUndefined" == pages.name)) {
          console.info("get ImageAttrsModifierUndefinedTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ImageEventPage page error:" + err);
      }
      console.info("ImageAttrsModifierUndefinedTest beforeEach end");

    });
    afterEach(async () => {
    });


    /**
     * @tc.number   ImageAttrsModifierUndefinedTest_static_0100
     * @tc.name     ImageAttrsModifierUndefinedTest_static_0100
     * @tc.desc     ImageAttrsModifierUndefinedTest_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('ImageAttrsModifierUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ImageAttrsModifierUndefinedTest_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyImageAttributeModifier');
      await CommonFunc.sleep(1000);

      console.info("[ImageAttrsModifierUndefinedTest_static_0100] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[ImageAttrsModifierUndefinedTest_static_0100] autoResize: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('autoResize')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('autoResize')))
        .assertEqual('\"true\"');

      let changeBtn = await driver.findComponent(ON.id('Image_AutoResize'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[ImageAttrsModifierUndefinedTest_static_0100] click Image_AutoResize");
      strJson = inspector.getInspectorByKey('MyImageAttributeModifier');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('autoResize')))
        .assertEqual('\"false\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[ImageAttrsModifierUndefinedTest_static_0100] END');
      done();
    });

    /**
     * @tc.number   ImageAttrsModifierUndefinedTest_static_0200
     * @tc.name     ImageAttrsModifierUndefinedTest_static_0200
     * @tc.desc     ImageAttrsModifierUndefinedTest_static_0200
     * @tc.level    Level.LEVEL1
     */
    it('ImageAttrsModifierUndefinedTest_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ImageAttrsModifierUndefinedTest_static_0200] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyImageAttributeModifier');
      await CommonFunc.sleep(1000);

      console.info("[ImageAttrsModifierUndefinedTest_static_0200] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[ImageAttrsModifierUndefinedTest_static_0200] copyOption: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('copyOption')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('copyOption')))
        .assertEqual('\"CopyOptions.InApp\"');

      let changeBtn = await driver.findComponent(ON.id('Image_CopyOption'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[ImageAttrsModifierUndefinedTest_static_0200] click Image_CopyOption");
      strJson = inspector.getInspectorByKey('MyImageAttributeModifier');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('copyOption')))
        .assertEqual('\"CopyOptions.None\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[ImageAttrsModifierUndefinedTest_static_0200] END');
      done();
    });

    /**
     * @tc.number   ImageAttrsModifierUndefinedTest_static_0400
     * @tc.name     ImageAttrsModifierUndefinedTest_static_0400
     * @tc.desc     ImageAttrsModifierUndefinedTest_static_0400
     * @tc.level    Level.LEVEL1
     */
    it('ImageAttrsModifierUndefinedTest_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ImageAttrsModifierUndefinedTest_static_0400] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyImageAttributeModifier');
      await CommonFunc.sleep(1000);

      console.info("[ImageAttrsModifierUndefinedTest_static_0400] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[ImageAttrsModifierUndefinedTest_static_0400] dynamicRangeMode: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('dynamicRangeMode')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('dynamicRangeMode')))
        .assertEqual('\"HIGH\"');

      let changeBtn = await driver.findComponent(ON.id('Image_DynamicRangeMode'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[ImageAttrsModifierUndefinedTest_static_0400] click Image_DynamicRangeMode");
      strJson = inspector.getInspectorByKey('MyImageAttributeModifier');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('dynamicRangeMode')))
        .assertEqual('\"STANDARD\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[ImageAttrsModifierUndefinedTest_static_0400] END');
      done();
    });
    /**
     * @tc.number   ImageAttrsModifierUndefinedTest_static_0500
     * @tc.name     ImageAttrsModifierUndefinedTest_static_0500
     * @tc.desc     ImageAttrsModifierUndefinedTest_static_0500
     * @tc.level    Level.LEVEL1
     */
    it('ImageAttrsModifierUndefinedTest_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ImageAttrsModifierUndefinedTest_static_0500] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyImageAttributeModifier');
      await CommonFunc.sleep(1000);

      console.info("[ImageAttrsModifierUndefinedTest_static_0500] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[ImageAttrsModifierUndefinedTest_static_0500] enableAnalyzer: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('enableAnalyzer')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('enableAnalyzer')))
        .assertEqual('\"true\"');

      let changeBtn = await driver.findComponent(ON.id('Image_EnableAnalyzer'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[ImageAttrsModifierUndefinedTest_static_0500] click Image_EnableAnalyzer");
      strJson = inspector.getInspectorByKey('MyImageAttributeModifier');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('enableAnalyzer')))
        .assertEqual('\"false\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[ImageAttrsModifierUndefinedTest_static_0500] END');
      done();
    });

    /**
     * @tc.number   ImageAttrsModifierUndefinedTest_static_0700
     * @tc.name     ImageAttrsModifierUndefinedTest_static_0700
     * @tc.desc     ImageAttrsModifierUndefinedTest_static_0700
     * @tc.level    Level.LEVEL1
     */
    it('ImageAttrsModifierUndefinedTest_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ImageAttrsModifierUndefinedTest_static_0700] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyImageAttributeModifier');
      await CommonFunc.sleep(1000);

      console.info("[ImageAttrsModifierUndefinedTest_static_0700] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[ImageAttrsModifierUndefinedTest_static_0700] interpolation: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('interpolation')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('interpolation')))
        .assertEqual('\"ImageInterpolation.Medium\"');

      let changeBtn = await driver.findComponent(ON.id('Image_Interpolation'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[ImageAttrsModifierUndefinedTest_static_0700] click Image_Interpolation");
      strJson = inspector.getInspectorByKey('MyImageAttributeModifier');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('interpolation')))
        .assertEqual('\"ImageInterpolation.None\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[ImageAttrsModifierUndefinedTest_static_0700] END');
      done();
    });
    /**
     * @tc.number   ImageAttrsModifierUndefinedTest_static_0800
     * @tc.name     ImageAttrsModifierUndefinedTest_static_0800
     * @tc.desc     ImageAttrsModifierUndefinedTest_static_0800
     * @tc.level    Level.LEVEL1
     */
    it('ImageAttrsModifierUndefinedTest_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ImageAttrsModifierUndefinedTest_static_0800] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyImageAttributeModifier');
      await CommonFunc.sleep(1000);

      console.info("[ImageAttrsModifierUndefinedTest_static_0800] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[ImageAttrsModifierUndefinedTest_static_0800] objectFit: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('objectFit')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('objectFit')))
        .assertEqual('\"ImageFit.Fill\"');

      let changeBtn = await driver.findComponent(ON.id('Image_ObjectFit'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[ImageAttrsModifierUndefinedTest_static_0800] click Image_ObjectFit");
      strJson = inspector.getInspectorByKey('MyImageAttributeModifier');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('objectFit')))
        .assertEqual('\"ImageFit.Cover\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[ImageAttrsModifierUndefinedTest_static_0800] END');
      done();
    });
    /**
     * @tc.number   ImageAttrsModifierUndefinedTest_static_0900
     * @tc.name     ImageAttrsModifierUndefinedTest_static_0900
     * @tc.desc     ImageAttrsModifierUndefinedTest_static_0900
     * @tc.level    Level.LEVEL1
     */
    it('ImageAttrsModifierUndefinedTest_static_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ImageAttrsModifierUndefinedTest_static_0900] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyImageAttributeModifier');
      await CommonFunc.sleep(1000);

      console.info("[ImageAttrsModifierUndefinedTest_static_0900] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[ImageAttrsModifierUndefinedTest_static_0900] objectRepeat: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('objectRepeat')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('objectRepeat')))
        .assertEqual('\"ImageRepeat.X\"');

      let changeBtn = await driver.findComponent(ON.id('Image_ObjectRepeat'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[ImageAttrsModifierUndefinedTest_static_0900] click Image_ObjectRepeat");
      strJson = inspector.getInspectorByKey('MyImageAttributeModifier');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('objectRepeat')))
        .assertEqual('\"ImageRepeat.NoRepeat\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[ImageAttrsModifierUndefinedTest_static_0900] END');
      done();
    });
    /**
     * @tc.number   ImageAttrsModifierUndefinedTest_static_1000
     * @tc.name     ImageAttrsModifierUndefinedTest_static_1000
     * @tc.desc     ImageAttrsModifierUndefinedTest_static_1000
     * @tc.level    Level.LEVEL1
     */
    it('ImageAttrsModifierUndefinedTest_static_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ImageAttrsModifierUndefinedTest_static_1000] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyImageAttributeModifier');
      await CommonFunc.sleep(1000);

      console.info("[ImageAttrsModifierUndefinedTest_static_1000] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[ImageAttrsModifierUndefinedTest_static_1000] orientation: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('orientation')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('orientation')))
        .assertEqual('\"2\"');

      let changeBtn = await driver.findComponent(ON.id('Image_Orientation'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[ImageAttrsModifierUndefinedTest_static_1000] click Image_Orientation");
      strJson = inspector.getInspectorByKey('MyImageAttributeModifier');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('orientation')))
        .assertEqual('\"1\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[ImageAttrsModifierUndefinedTest_static_1000] END');
      done();
    }); /**
     * @tc.number   ImageAttrsModifierUndefinedTest_static_1100
     * @tc.name     ImageAttrsModifierUndefinedTest_static_1100
     * @tc.desc     ImageAttrsModifierUndefinedTest_static_1100
     * @tc.level    Level.LEVEL1
     */
    it('ImageAttrsModifierUndefinedTest_static_1100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ImageAttrsModifierUndefinedTest_static_1100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyImageAttributeModifier');
      await CommonFunc.sleep(1000);

      console.info("[ImageAttrsModifierUndefinedTest_static_1100] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[ImageAttrsModifierUndefinedTest_static_1100] privacySensitive: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('privacySensitive')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('privacySensitive')))
        .assertEqual('true');

      let changeBtn = await driver.findComponent(ON.id('Image_PrivacySensitive'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[ImageAttrsModifierUndefinedTest_static_1100] click Image_PrivacySensitive");
      strJson = inspector.getInspectorByKey('MyImageAttributeModifier');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('privacySensitive')))
        .assertEqual('false');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[ImageAttrsModifierUndefinedTest_static_1100] END');
      done();
    });
    /**
     * @tc.number   ImageAttrsModifierUndefinedTest_static_1200
     * @tc.name     ImageAttrsModifierUndefinedTest_static_1200
     * @tc.desc     ImageAttrsModifierUndefinedTest_static_1200
     * @tc.level    Level.LEVEL1
     */
    it('ImageAttrsModifierUndefinedTest_static_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ImageAttrsModifierUndefinedTest_static_1200] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyImageAttributeModifier');
      await CommonFunc.sleep(1000);

      console.info("[ImageAttrsModifierUndefinedTest_static_1200] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[ImageAttrsModifierUndefinedTest_static_1200] renderMode: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('renderMode')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('renderMode')))
        .assertEqual('\"ImageRenderMode.Template\"');

      let changeBtn = await driver.findComponent(ON.id('Image_RenderMode'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[ImageAttrsModifierUndefinedTest_static_1200] click Image_RenderMode");
      strJson = inspector.getInspectorByKey('MyImageAttributeModifier');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('renderMode')))
        .assertEqual('\"ImageRenderMode.Original\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[ImageAttrsModifierUndefinedTest_static_1200] END');
      done();
    });

    /**
     * @tc.number   ImageAttrsModifierUndefinedTest_static_1300
     * @tc.name     ImageAttrsModifierUndefinedTest_static_1300
     * @tc.desc     ImageAttrsModifierUndefinedTest_static_1300
     * @tc.level    Level.LEVEL1
     */
    it('ImageAttrsModifierUndefinedTest_static_1300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ImageAttrsModifierUndefinedTest_static_1300] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyImageAttributeModifier');
      await CommonFunc.sleep(1000);

      console.info("[ImageAttrsModifierUndefinedTest_static_1300] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[ImageAttrsModifierUndefinedTest_static_1300] syncLoad: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('syncLoad')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('syncLoad')))
        .assertEqual('\"true\"');

      let changeBtn = await driver.findComponent(ON.id('Image_SyncLoad'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[ImageAttrsModifierUndefinedTest_static_1300] click Image_SyncLoad");
      strJson = inspector.getInspectorByKey('MyImageAttributeModifier');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('syncLoad')))
        .assertEqual('\"false\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[ImageAttrsModifierUndefinedTest_static_1300] END');
      done();
    });
  })
}
