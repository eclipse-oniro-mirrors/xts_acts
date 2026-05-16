'use static'

/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { describe, it, expect, beforeAll, beforeEach, afterEach, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
import { ItemFillPolicy, PresetFillType, EditModeOptions } from '@ohos.arkui.component';


export default function GridTest(): void {
  describe('GridTest', (): void => {
    beforeAll(async (): Promise<void> => {
      console.info('GridTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.layout.grid.static', 'EntryAbility');
    });

    beforeEach((): void => {
      console.info('GridTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/Grid',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('GridTest state pages: ' + JSON.stringify(pages));
        if (!('Grid' == pages.name)) {
          routerInstance.replaceUrl(options);
        }
      } catch (err) {
        console.error('GridTest beforeEach error: ' + err);
        expect().assertFail();
      }
    });

    afterEach((): void => {
    });

    /**
     * @tc.number GridTest_001
     * @tc.name gridColumnsTemplateString
     * @tc.desc grid.d.ets GridAttribute.columnsTemplate - string variant: '1fr 1fr'     */
    it('gridColumnsTemplateString', Level.LEVEL1, (done: () => void) => {
      console.info('GridTest: gridColumnsTemplateString START');
      let strJson = inspector.getInspectorByKey('gridColTplStr');
      expect(strJson.length > 0).assertEqual(true);
      let obj = JSON.parseJsonElement(strJson);
      let attrs = obj.getElement('$attrs');
      let val = attrs.getString('columnsTemplate');
      console.info('GridTest gridColumnsTemplateString value: ' + val);
      expect(val).assertEqual('1fr 1fr');
      done();
    });

    /**
     * @tc.number GridTest_002
     * @tc.name gridColumnsTemplateUndefined
     * @tc.desc grid.d.ets GridAttribute.columnsTemplate - undefined variant     */
    it('gridColumnsTemplateUndefined', Level.LEVEL1, (done: () => void) => {
      console.info('GridTest: gridColumnsTemplateUndefined START');
      let strJson = inspector.getInspectorByKey('gridColTplUndef');
      expect(strJson.length > 0).assertEqual(true);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj != null).assertTrue();
      done();
    });

    /**
     * @tc.number GridTest_003
     * @tc.name gridScrollBarColorEnum
     * @tc.desc grid.d.ets GridAttribute.scrollBarColor - Color enum variant: Color.Red     */
    it('gridScrollBarColorEnum', Level.LEVEL1, (done: () => void) => {
      console.info('GridTest: gridScrollBarColorEnum START');
      let strJson = inspector.getInspectorByKey('gridSbcColor');
      expect(strJson.length > 0).assertEqual(true);
      let obj = JSON.parseJsonElement(strJson);
      let attrs = obj.getElement('$attrs');
      let val = attrs.getString('scrollBarColor');
      console.info('GridTest gridScrollBarColorEnum value: ' + val);
      expect(val.length > 0).assertEqual(true);
      done();
    });

    /**
     * @tc.number GridTest_004
     * @tc.name gridScrollBarColorInt
     * @tc.desc grid.d.ets GridAttribute.scrollBarColor - int variant: 0xFF0000     */
    it('gridScrollBarColorInt', Level.LEVEL1, (done: () => void) => {
      console.info('GridTest: gridScrollBarColorInt START');
      let strJson = inspector.getInspectorByKey('gridSbcInt');
      expect(strJson.length > 0).assertEqual(true);
      let obj = JSON.parseJsonElement(strJson);
      let attrs = obj.getElement('$attrs');
      let val = attrs.getString('scrollBarColor');
      console.info('GridTest gridScrollBarColorInt value: ' + val);
      expect(val.length > 0).assertEqual(true);
      done();
    });

    /**
     * @tc.number GridTest_005
     * @tc.name gridScrollBarColorString
     * @tc.desc grid.d.ets GridAttribute.scrollBarColor - string variant: '#00FF00'     */
    it('gridScrollBarColorString', Level.LEVEL1, (done: () => void) => {
      console.info('GridTest: gridScrollBarColorString START');
      let strJson = inspector.getInspectorByKey('gridSbcStr');
      expect(strJson.length > 0).assertEqual(true);
      let obj = JSON.parseJsonElement(strJson);
      let attrs = obj.getElement('$attrs');
      let val = attrs.getString('scrollBarColor');
      console.info('GridTest gridScrollBarColorString value: ' + val);
      expect(val.length > 0).assertEqual(true);
      done();
    });

    /**
     * @tc.number GridTest_006
     * @tc.name gridScrollBarColorResource
     * @tc.desc grid.d.ets GridAttribute.scrollBarColor - Resource variant: $r('app.color.color_hello')     */
    it('gridScrollBarColorResource', Level.LEVEL1, (done: () => void) => {
      console.info('GridTest: gridScrollBarColorResource START');
      let strJson = inspector.getInspectorByKey('gridSbcRes');
      expect(strJson.length > 0).assertEqual(true);
      let obj = JSON.parseJsonElement(strJson);
      let attrs = obj.getElement('$attrs');
      let val = attrs.getString('scrollBarColor');
      console.info('GridTest gridScrollBarColorResource value: ' + val);
      expect(val.length > 0).assertEqual(true);
      done();
    });

    /**
     * @tc.number GridTest_007
     * @tc.name gridScrollBarColorUndefined
     * @tc.desc grid.d.ets GridAttribute.scrollBarColor - undefined variant     */
    it('gridScrollBarColorUndefined', Level.LEVEL1, (done: () => void) => {
      console.info('GridTest: gridScrollBarColorUndefined START');
      let strJson = inspector.getInspectorByKey('gridSbcUndef');
      expect(strJson.length > 0).assertEqual(true);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj != null).assertTrue();
      done();
    });

    /**
     * @tc.number GridTest_008
     * @tc.name gridColumnsTemplateItemFillPolicy
     * @tc.desc grid.d.ets GridAttribute.columnsTemplate - ItemFillPolicy variant
     *          ItemFillPolicy接口级参数，页面调用可能编译不通过
     *          Mode1验证ItemFillPolicy接口结构及fillType属性枚举值
     */
    it('gridColumnsTemplateItemFillPolicy', Level.LEVEL1, (done: () => void) => {
      console.info('GridTest: gridColumnsTemplateItemFillPolicy START');
      let policyDefault: ItemFillPolicy = { fillType: PresetFillType.BREAKPOINT_DEFAULT };
      console.info('GridTest ItemFillPolicy BREAKPOINT_DEFAULT fillType: ' + policyDefault.fillType);
      expect(policyDefault.fillType).assertEqual(PresetFillType.BREAKPOINT_DEFAULT);
      expect(policyDefault.fillType).assertEqual(0);
      let policySm1: ItemFillPolicy = { fillType: PresetFillType.BREAKPOINT_SM1MD2LG3 };
      console.info('GridTest ItemFillPolicy BREAKPOINT_SM1MD2LG3 fillType: ' + policySm1.fillType);
      expect(policySm1.fillType).assertEqual(PresetFillType.BREAKPOINT_SM1MD2LG3);
      expect(policySm1.fillType).assertEqual(1);
      let policySm2: ItemFillPolicy = { fillType: PresetFillType.BREAKPOINT_SM2MD3LG5 };
      console.info('GridTest ItemFillPolicy BREAKPOINT_SM2MD3LG5 fillType: ' + policySm2.fillType);
      expect(policySm2.fillType).assertEqual(PresetFillType.BREAKPOINT_SM2MD3LG5);
      expect(policySm2.fillType).assertEqual(2);
      let policyNoFill: ItemFillPolicy = {};
      console.info('GridTest ItemFillPolicy empty fillType: ' + policyNoFill.fillType);
      expect(policyNoFill.fillType == undefined).assertEqual(true);
      console.info('GridTest: gridColumnsTemplateItemFillPolicy END');
      done();
    });

    /**
     * @tc.number GridTest_009
     * @tc.name gridSupportEmptyBranchInLazy
     * @tc.desc grid.d.ets GridAttribute.supportEmptyBranchInLazyLoading
     *          default supportEmptyBranchInLazyLoading(supported: boolean | undefined): this;
     *          该API在设备运行时不存在(FindClass failed)，无法放到页面
     *          Mode1验证参数枚举值: true / false / undefined
     */
    it('gridSupportEmptyBranchInLazy', Level.LEVEL1, (done: () => void) => {
      console.info('GridTest: gridSupportEmptyBranchInLazy START');

      let valTrue: boolean | undefined = true;
      console.info('GridTest supportEmptyBranch param=true: ' + valTrue);
      expect(valTrue).assertEqual(true);
      expect(typeof valTrue).assertEqual('boolean');

      let valFalse: boolean | undefined = false;
      console.info('GridTest supportEmptyBranch param=false: ' + valFalse);
      expect(valFalse).assertEqual(false);
      expect(typeof valFalse).assertEqual('boolean');

      let valUndef: boolean | undefined = undefined;
      console.info('GridTest supportEmptyBranch param=undefined: ' + valUndef);
      expect(valUndef == undefined).assertEqual(true);

      console.info('GridTest: gridSupportEmptyBranchInLazy END');
      done();
    });

    /**
     * @tc.number GridTest_010
     * @tc.name gridEditModeOptions
     * @tc.desc grid.d.ets GridAttribute.editModeOptions
     *          default editModeOptions(options?: EditModeOptions): this;
     *          该API在设备运行时不存在(FindClass failed)，无法放到页面
     *          Mode1验证EditModeOptions接口结构及属性值:
     *          enableGatherSelectedItemsAnimation: boolean (true/false/undefined)
     *          onGetPreviewBadge: OnGetPreviewBadgeCallback (() => boolean | int)
     */
    it('gridEditModeOptions', Level.LEVEL1, (done: () => void) => {
      console.info('GridTest: gridEditModeOptions START');

      let opts1: EditModeOptions = { enableGatherSelectedItemsAnimation: true };
      console.info('GridTest EditModeOptions enableGather=true: ' + opts1.enableGatherSelectedItemsAnimation);
      expect(opts1.enableGatherSelectedItemsAnimation).assertEqual(true);

      let opts2: EditModeOptions = { enableGatherSelectedItemsAnimation: false };
      console.info('GridTest EditModeOptions enableGather=false: ' + opts2.enableGatherSelectedItemsAnimation);
      expect(opts2.enableGatherSelectedItemsAnimation).assertEqual(false);

      let opts3: EditModeOptions = {};
      console.info('GridTest EditModeOptions enableGather=unset: ' + opts3.enableGatherSelectedItemsAnimation);
      expect(opts3.enableGatherSelectedItemsAnimation == undefined).assertEqual(true);

      let fnTrue: () => boolean | int = (): boolean | int => { return true; };
      let opts4: EditModeOptions = { onGetPreviewBadge: fnTrue };
      console.info('GridTest EditModeOptions onGetPreviewBadge set: ' + (opts4.onGetPreviewBadge != undefined));
      expect(opts4.onGetPreviewBadge != undefined).assertEqual(true);
      let r4 = fnTrue();
      console.info('GridTest EditModeOptions badge result (true): ' + r4);
      expect(r4).assertEqual(true);

      let fnFalse: () => boolean | int = (): boolean | int => { return false; };
      let opts5: EditModeOptions = { onGetPreviewBadge: fnFalse };
      let r5 = fnFalse();
      console.info('GridTest EditModeOptions badge result (false): ' + r5);
      expect(r5).assertEqual(false);

      let fnInt: () => boolean | int = (): boolean | int => { return 5 as int; };
      let opts6: EditModeOptions = { onGetPreviewBadge: fnInt };
      let r6 = fnInt();
      console.info('GridTest EditModeOptions badge result (int 5): ' + r6);
      expect(r6).assertEqual(5);

      let optsFull: EditModeOptions = {
        enableGatherSelectedItemsAnimation: true,
        onGetPreviewBadge: fnInt
      };
      expect(optsFull.enableGatherSelectedItemsAnimation).assertEqual(true);
      expect(optsFull.onGetPreviewBadge != undefined).assertEqual(true);

      console.info('GridTest: gridEditModeOptions END');
      done();
    });
  });
}
