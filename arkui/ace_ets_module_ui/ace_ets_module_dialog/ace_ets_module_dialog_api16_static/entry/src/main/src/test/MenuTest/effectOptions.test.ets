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
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level, TestType, Size } from "../../../../hypium/index"
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
import deviceInfo from "@ohos.deviceInfo"
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function effectOptions() {
  describe('effectOptions', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.dialog.api16.static", "EntryAbility")
      
    })

    beforeEach(async () => {
      console.info("effectOptions beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Menu/EffectOptions',
      }
      try {
        const effectOptions = AppStorage.get<Router>("router") as Router
        // effectOptions.clear();
        let pages: router.RouterState = effectOptions.getState();
        console.info("get effectOptions state pages: " + JSON.stringify(pages));
        if (!("EffectOptions" == pages.name)) {
          console.info("get effectOptions state pages.name: " + JSON.stringify(pages.name));
          effectOptions.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push effectOptions page error: " + err);
      }
    });


    
    /**
     * @tc.number   EffectOptionsTest_static_0101
     * @tc.name     EffectOptionsTest_static_0101
     * @tc.desc     EffectOptionsTest_static_0101
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
it('EffectOptionsTest_static_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('EffectOptionsTest_static_0101 START');
      const SLEEP_TIME = 1000;
      await CommonFunc.sleep(SLEEP_TIME);
      inspector.sendEventByKey('EffectOptions_btn1', 10, '');
      await CommonFunc.sleep(SLEEP_TIME);
      console.info('EffectOptionsTest_static_0101 click after');
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(SLEEP_TIME);
      let tree = JSON.stringify(JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree())).getArray('$children').length);
      let menu:object = {} as object;
      if (tree && tree === '2') {
        menu = obj.getArray('$children')[1].getArray('$children')[0];
      } else {
        menu = obj.getArray('$children')[0].getArray('$children')[0];
      }
      let uniRenderFlag: string = menu.getElement('$attrs').getString('uniRender');
      console.info('[EffectOptionsTest_static_0101] uniRenderFlag is: ' + uniRenderFlag);
      if (uniRenderFlag === 'false') {
        let text = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray('$children')[1].getArray('$children')[0].getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('color');
        expect(text).assertEqual('#00000000');
      } else if (tree && tree === '2') {
        let text = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray('$children')[1].getArray('$children')[0].getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('color');
        expect(text).assertEqual('#FFFFA500');
      } else {
        let text = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray('$children')[0].getArray('$children')[0].getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('brightness');
        expect(text).assertEqual('1');
      }
      await CommonFunc.sleep(SLEEP_TIME);
      inspector.sendEventByKey('EffectOptions_btn1', 10, '');
      await CommonFunc.sleep(SLEEP_TIME);
      console.info('EffectOptionsTest_static_0101 END');
      done();
    });


    
    /**
     * @tc.number   EffectOptionsTest_static_0102
     * @tc.name     EffectOptionsTest_static_0102
     * @tc.desc     EffectOptionsTest_static_0102
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
it('EffectOptionsTest_static_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('EffectOptionsTest_static_0102 START');
      const SLEEP_TIME = 2000;
      await CommonFunc.sleep(SLEEP_TIME);
      inspector.sendEventByKey('EffectOptions_btn2', 10, '');
      await CommonFunc.sleep(SLEEP_TIME);
      console.info('EffectOptionsTest_static_0102 click after');
      let tree = JSON.stringify(JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree())).getArray('$children').length);
      if (tree && tree === '2') {
        let text = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray('$children')[1].getArray('$children')[0].getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('color');
        expect(text).assertEqual('#00000000');
      } else {
        let text = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray('$children')[0].getArray('$children')[0].getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('color');
        expect(text).assertEqual('#00000000');
      }
      await CommonFunc.sleep(SLEEP_TIME);
      inspector.sendEventByKey('EffectOptions_btn2', 10, '');
      await CommonFunc.sleep(SLEEP_TIME);
      console.info('EffectOptionsTest_static_0102 END');
      done();
    });


    
    /**
     * @tc.number   EffectOptionsTest_static_0103
     * @tc.name     EffectOptionsTest_static_0103
     * @tc.desc     EffectOptionsTest_static_0103
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('EffectOptionsTest_static_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('EffectOptionsTest_static_0103 START');
      const SLEEP_TIME = 2000;
      await CommonFunc.sleep(SLEEP_TIME);
      inspector.sendEventByKey('EffectOptions_btn3', 10, '');
      await CommonFunc.sleep(SLEEP_TIME);
      console.info('EffectOptionsTest_static_0103 click after');
      let tree = JSON.stringify(JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree())).getArray('$children').length);
      console.info('color3' + tree);
      if (tree && tree === '2') {
        let text = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray('$children')[1].getArray('$children')[0].getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('color');
        expect(text).assertEqual('#00000000');
      } else {
        let text = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray('$children')[0].getArray('$children')[0].getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('color');
        expect(text).assertEqual('#00000000');
      }
      await CommonFunc.sleep(SLEEP_TIME);
      inspector.sendEventByKey('EffectOptionsc_btn3', 10, '');
      await CommonFunc.sleep(SLEEP_TIME);
      console.info('EffectOptionsTest_static_0103 END');
      done();
    });
  })
}