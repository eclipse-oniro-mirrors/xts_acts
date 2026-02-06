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

import events_emitter from '@ohos.events.emitter';
import { Color,$r } from '@ohos.arkui.component'
import { describe, beforeEach, it, expect, Level, beforeAll, Size, TestType, afterEach } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';

export default function SelectModifierTest() {
  describe('SelectModifierTest', () => {
    const SLEEP_TIME_1000 = 1000;
    beforeAll(() => {
      console.info("SelectModifierTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.nowear.api20.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("SelectModifierTest beforeEach start");
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SelectModifierTest state pages:" + JSON.stringify(pages));
        if (!("selectModifier" == pages.name)) {
          console.info("get  SelectModifierTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl({
            url: 'MainAbility/pages/select/selectModifier',
          })
        }
      } catch (err) {
        console.error("push SelectModifierTest page error:" + err);
      }
      console.info("SelectModifierTest foreEach end");
    });

    /**
     * @tc.number   selectModifier_static_0100
     * @tc.name     selectModifier_static_0100
     * @tc.desc     Test the textModifier interface
     * @tc.level    LEVEL2
     */
    it('selectModifier_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'selectModifier_static_0100';
      console.info('[' + tagName + '] START============================');
      let strJson = inspector.getInspectorByKey('Select');
      let obj = JSON.parseJsonElement(strJson);
      let textModifier = obj.getElement('$attrs').getString('font');
      let strJson1 = JSON.parseJsonElement(textModifier).getString('size');
      console.info("[selectModifier_static_0100] fontsize is: " + strJson1);
      expect(JSON.parseJsonElement(textModifier).getString('size')).assertEqual('50.00vp');
      let textModifier1 = obj.getElement('$attrs').getString('fontColor');
      console.info("[selectModifier_static_0100] fontColor is: " + textModifier1);
      expect(textModifier1).assertEqual('#FFFF1235');
      let textModifier2 = obj.getElement('$attrs').getString('maxLines');
      console.info("[selectModifier_static_0100] maxLines is: " + textModifier2);
      expect(textModifier2).assertEqual('2');
      console.info('[' + tagName + '] END============================');
      done();
    });

    /**
     * @tc.number   selectModifier_static_0200
     * @tc.name     selectModifier_static_0200
     * @tc.desc     Test the selectedOptionTextModifier interface
     * @tc.level    LEVEL2
     */
    it('selectModifier_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'selectModifier_static_0200';
      console.info('[' + tagName + '] START============================');
      let strJson = inspector.getInspectorByKey('Select');
      let obj = JSON.parseJsonElement(strJson);
      let selectedOptionTextModifier = obj.getElement('$attrs').getString('selectedOptionFont');
      let strJson1 = JSON.parseJsonElement(selectedOptionTextModifier).getString('size');
      console.info("[selectModifier_static_0200] selectedOptionFontSize is: " + strJson1);
      expect(JSON.parseJsonElement(selectedOptionTextModifier).getString('size')).assertEqual('51.00vp');
      let selectedOptionTextModifier1 = obj.getElement('$attrs').getString('selectedOptionFontColor');
      console.info("[selectModifier_static_0200] selectedOptionFontColor is: " + selectedOptionTextModifier1);
      expect(selectedOptionTextModifier1).assertEqual('#FFFF1236');
      let selectedOptionTextModifier2 = obj.getElement('$attrs').getString('selectedOptionMaxLines');
      console.info("[selectModifier_static_0200] selectedOptionMaxLines is: " + selectedOptionTextModifier2);
      expect(selectedOptionTextModifier2).assertEqual('3');
      console.info('[' + tagName + '] END============================');
      await Utils.sleep(SLEEP_TIME_1000);
      done();
    });

    /**
     * @tc.number   selectModifier_static_0300
     * @tc.name     selectModifier_static_0300
     * @tc.desc     Test the optionTextModifier interface
     * @tc.level    LEVEL2
     */
    it('selectModifier_static_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'selectModifier_static_0300';
      console.info('[' + tagName + '] START============================');
      let strJson = inspector.getInspectorByKey('Select');
      let obj = JSON.parseJsonElement(strJson);
      let optionTextModifier = obj.getElement('$attrs').getString('optionFont');
      let strJson1 = JSON.parseJsonElement(optionTextModifier).getString('size');
      console.info("[selectModifier_static_0300] optionFontSize is: " + strJson1);
      expect(JSON.parseJsonElement(optionTextModifier).getString('size')).assertEqual('52.00vp');
      let optionTextModifier1 = obj.getElement('$attrs').getString('optionFontColor');
      console.info("[selectModifier_static_0300] optionFontColor is: " + optionTextModifier1);
      expect(optionTextModifier1).assertEqual('#FFFF1237');
      let optionTextModifier2 = obj.getElement('$attrs').getString('optionMaxLines');
      console.info("[selectModifier_static_0300] optionMaxLines is: " + optionTextModifier2);
      expect(optionTextModifier2).assertEqual('4');
      console.info('[' + tagName + '] END============================');
      await Utils.sleep(SLEEP_TIME_1000);
      done();
    });

    /**
     * @tc.number   selectModifier_static_0400
     * @tc.name     selectModifier_static_0400
     * @tc.desc     Test the arrowModifier interface
     * @tc.level    LEVEL2
     */
    it('selectModifier_static_0400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'selectModifier_static_0400';
      console.info('[' + tagName + '] START============================');
      let strJson = inspector.getInspectorByKey('Select');
      let obj = JSON.parseJsonElement(strJson);
      let arrowModifier = obj.getElement('$attrs').getString('symbolFontSize');
      console.info("[selectModifier_static_0400] symbolFontSize is: " + arrowModifier);
      expect(arrowModifier).assertEqual('53.00vp');
      let arrowModifier1 = obj.getElement('$attrs').getString('symbolColorList');
      console.info("[selectModifier_static_0400] symbolColorList is: " + arrowModifier1);
      expect(arrowModifier1).assertEqual('#FFFF1238, #FFFF1238, #FFFF1238');
      console.info('[' + tagName + '] END============================');
      await Utils.sleep(SLEEP_TIME_1000);
      done();
    });

    /**
     * @tc.number   selectModifier_static_0500
     * @tc.name     selectModifier_static_0500
     * @tc.desc     Test the textModifier interface
     * @tc.level    LEVEL2
     */
    it('selectModifier_static_0500', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'selectModifier_static_0500';
      console.info('[' + tagName + '] START============================');
      let strJson = inspector.getInspectorByKey('Select2');
      let obj = JSON.parseJsonElement(strJson);
      let textModifier = obj.getElement('$attrs').getString('font');
      let strJson1 = JSON.parseJsonElement(textModifier).getString('size');
      console.info("[selectModifier_static_0500] fontsize is: " + strJson1);
      expect(JSON.parseJsonElement(textModifier).getString('size')).assertEqual('40.00vp');
      console.info('[' + tagName + '] END============================');
      done();
    });

    /**
     * @tc.number   selectModifier_static_0600
     * @tc.name     selectModifier_static_0600
     * @tc.desc     Test the selectedOptionTextModifier interface
     * @tc.level    LEVEL2
     */
    it('selectModifier_static_0600', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'selectModifier_static_0600';
      console.info('[' + tagName + '] START============================');
      let strJson = inspector.getInspectorByKey('Select2');
      let obj = JSON.parseJsonElement(strJson);
      let selectedOptionTextModifier = obj.getElement('$attrs').getString('selectedOptionFont');
      let strJson1 = JSON.parseJsonElement(selectedOptionTextModifier).getString('size');
      console.info("[selectModifier_static_0600] selectedOptionFontSize is: " + strJson1);
      expect(JSON.parseJsonElement(selectedOptionTextModifier).getString('size')).assertEqual('41.00vp');
      console.info('[' + tagName + '] END============================');
      await Utils.sleep(SLEEP_TIME_1000);
      done();
    });

    /**
     * @tc.number   selectModifier_static_0700
     * @tc.name     selectModifier_static_0700
     * @tc.desc     Test the optionTextModifier interface
     * @tc.level    LEVEL2
     */
    it('selectModifier_static_0700', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'selectModifier_static_0700';
      console.info('[' + tagName + '] START============================');
      let strJson = inspector.getInspectorByKey('Select2');
      let obj = JSON.parseJsonElement(strJson);
      let optionTextModifier = obj.getElement('$attrs').getString('optionFont');
      let strJson1 = JSON.parseJsonElement(optionTextModifier).getString('size');
      console.info("[selectModifier_static_0700] optionFontSize is: " + strJson1);
      expect(JSON.parseJsonElement(optionTextModifier).getString('size')).assertEqual('42.00vp');
      console.info('[' + tagName + '] END============================');
      await Utils.sleep(SLEEP_TIME_1000);
      done();
    });

    /**
     * @tc.number   selectModifier_static_0800
     * @tc.name     selectModifier_static_0800
     * @tc.desc     Test the arrowModifier interface
     * @tc.level    LEVEL2
     */
    it('selectModifier_static_0800', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'selectModifier_static_0800';
      console.info('[' + tagName + '] START============================');
      let strJson = inspector.getInspectorByKey('Select2');
      let obj = JSON.parseJsonElement(strJson);
      let arrowModifier = obj.getElement('$attrs').tryGetString('symbolFontSize');
      console.info("[selectModifier_static_0800] symbolFontSize is: " + arrowModifier);
      expect(arrowModifier).assertEqual('');
      console.info('[' + tagName + '] END============================');
      await Utils.sleep(SLEEP_TIME_1000);
      done();
    });
  })
}
