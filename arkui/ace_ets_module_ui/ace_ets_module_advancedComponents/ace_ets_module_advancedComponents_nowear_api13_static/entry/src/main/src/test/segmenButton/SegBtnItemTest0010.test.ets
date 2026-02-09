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
import router from '@ohos.router';
import { beforeEach, describe, expect, it, Level, beforeAll, afterEach } from '../../../../hypium/index';
import { i18n } from '@kit.LocalizationKit';
import display from '@ohos.display';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest } from '../Util.test'
import inspector from '@ohos.arkui.inspector'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function SegBtnItemTest0010() {
  describe('SegBtnItemTest0010', () => {

    beforeAll(() => {
      console.info("SegBtnItemTest0010 beforeEach start");
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.nowear.api13.static", "EntryAbility")
    });

    beforeEach(async () => {
      console.info("SegBtnItemTest0010 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/segmentButton/SegBtnItem0010",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("SegBtnItem0010" == pages.name)) {
          console.info("get SegBtnItemTest0010 pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SegBtnItemTest0010 page error:" + err);
      }
      console.info("SegBtnItemTest0010 beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SegBtnItemTest0010 after each called");
    });

    
    
    /**
     * @tc.number   SegBtnItemTest0010_static_001
     * @tc.name     SegBtnItemTest0010_static_001
     * @tc.desc     SegBtnItemTest0010_static_001
     * @tc.level    Level.LEVEL1
     */
it('SegBtnItemTest0010_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SegBtnItemTest0010_static_001] START');
      await CommonFunc.sleep(1000);
      let btn0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[2]
        .getArray('$children')[0]
      console.info("[SegBtnItemTest0010_static_001] btn0.$attrs.accessibilityLevel is: " +
      JSON.stringify(btn0.getElement('$attrs').getString('accessibilityLevel')));
      console.info("[SegBtnItemTest0010_static_001] btn0.$attrs.accessibilityDescription is: " +
      JSON.stringify(btn0.getElement('$attrs').getString('accessibilityDescription')));
      expect(btn0.getElement('$attrs').getString('accessibilityLevel')).assertEqual('auto');
      expect(btn0.getElement('$attrs').getString('accessibilityDescription')).assertEqual('tab1');
      await CommonFunc.sleep(500);
      let btn1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[2]
        .getArray('$children')[1]
      console.info("[SegBtnItemTest0010_static_001] btn1.$attrs.accessibilityLevel is: " +
      JSON.stringify(btn1.getElement('$attrs').getString('accessibilityLevel')));
      expect(btn1.getElement('$attrs').getString('accessibilityLevel')).assertEqual('no');
      await CommonFunc.sleep(500);
      let btn2 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[2]
        .getArray('$children')[2]
      console.info("[SegBtnItemTest0010_static_001] btn2.$attrs.accessibilityLevel is: " +
      JSON.stringify(btn2.getElement('$attrs').getString('accessibilityLevel')));
      expect(btn2.getElement('$attrs').getString('accessibilityLevel')).assertEqual('yes');
      await CommonFunc.sleep(500);
      let btn3 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[2]
        .getArray('$children')[3]
      console.info("[SegBtnItemTest0010_static_001]  btn3.$attrs.accessibilityLevel is: " +
      JSON.stringify(btn3.getElement('$attrs').getString('accessibilityLevel')));
      expect(btn3.getElement('$attrs').getString('accessibilityLevel')).assertEqual('no-hide-descendants');
      console.info('[SegBtnItemTest0010_static_001] END');
      done();
    });

    
    
    /**
     * @tc.number   SegBtnItemTest0010_static_002
     * @tc.name     SegBtnItemTest0010_static_002
     * @tc.desc     SegBtnItemTest0010_static_002
     * @tc.level    Level.LEVEL1
     */
it('SegBtnItemTest0010_static_002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SegBtnItemTest0010_static_002] START');
      await CommonFunc.sleep(1000);
      let btn0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray('$children')[0]
        .getArray('$children')[1]
        .getArray('$children')[2]
        .getArray('$children')[0]
      console.info("[SegBtnItemTest0010_static_001] btn0.$attrs.accessibilityLevel is: " +
      JSON.stringify(btn0.getElement('$attrs').getString('accessibilityLevel')));
      console.info("[SegBtnItemTest0010_static_001] btn0.$attrs.accessibilityDescription is: " +
      JSON.stringify(btn0.getElement('$attrs').getString('accessibilityDescription')));
      expect(btn0.getElement('$attrs').getString('accessibilityLevel')).assertEqual('auto');
      expect(btn0.getElement('$attrs').getString('accessibilityDescription')).assertEqual('email1');
      await CommonFunc.sleep(500);
      let btn1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray('$children')[0]
        .getArray('$children')[1]
        .getArray('$children')[2]
        .getArray('$children')[1]
      console.info("[SegBtnItemTest0010_static_001] btn1.$attrs.accessibilityLevel is: " +
      JSON.stringify(btn1.getElement('$attrs').getString('accessibilityLevel')));
      expect(btn1.getElement('$attrs').getString('accessibilityLevel')).assertEqual('no');
      await CommonFunc.sleep(500);
      let btn2 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray('$children')[0]
        .getArray('$children')[1]
        .getArray('$children')[2]
        .getArray('$children')[2]
      console.info("[SegBtnItemTest0010_static_001] btn2.$attrs.accessibilityLevel is: " +
      JSON.stringify(btn2.getElement('$attrs').getString('accessibilityLevel')));
      expect(btn2.getElement('$attrs').getString('accessibilityLevel')).assertEqual('yes');
      await CommonFunc.sleep(500);
      let btn3 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray('$children')[0]
        .getArray('$children')[1]
        .getArray('$children')[2]
        .getArray('$children')[3]
      console.info("[SegBtnItemTest0010_static_001] btn3.$attrs.accessibilityLevel is: " +
      JSON.stringify(btn3.getElement('$attrs').getString('accessibilityLevel')));
      expect(btn3.getElement('$attrs').getString('accessibilityLevel')).assertEqual('no-hide-descendants');
      await CommonFunc.sleep(500);
      let icon0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray('$children')[0]
        .getArray('$children')[1]
        .getArray('$children')[2]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
      console.info("[SegBtnItemTest0010_static_001] icon0.$attrs.selectedIcon is: " +
      JSON.stringify(icon0.getElement('$attrs').getString('src')));
      console.info("[SegBtnItemTest0010_static_001] icon0.getElement('$attrs').getString('accessibilityText') is: " +
      JSON.stringify(icon0.getElement('$attrs').getString('accessibilityText')));
      expect(icon0.getElement('$attrs').getString('src')).assertEqual('resource:///125830169.svg');
      expect(icon0.getElement('$attrs').getString('accessibilityText')).assertEqual('email1');
      await CommonFunc.sleep(500);
      let icon1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray('$children')[0]
        .getArray('$children')[1]
        .getArray('$children')[2]
        .getArray('$children')[1]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
      console.info("[SegBtnItemTest0010_static_001] icon1.$attrs.icon is: " + JSON.stringify(icon1.getElement('$attrs').getString('src')));
      console.info("[SegBtnItemTest0010_static_001] icon1.$attrs.accessibilityText is: " +
      JSON.stringify(icon1.getElement('$attrs').getString('accessibilityText')));
      expect(icon1.getElement('$attrs').getString('src')).assertEqual('resource:///125830170.svg');
      expect(icon1.getElement('$attrs').getString('accessibilityText')).assertEqual('notSelect');
      console.info('[SegBtnItemTest0010_static_002] END');
      done();
    });
  })
}
