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
import { LengthConstrain, ItemFillPolicy, CacheCountInfo, PresetFillType, EditModeOptions } from '@ohos.arkui.component';


export default function ListImageTest(): void {
  describe('ListImageTest', (): void => {
    beforeAll(async (): Promise<void> => {
      console.info('ListImageTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.imageText.image.static', 'EntryAbility');
    });

    beforeEach((): void => {
      console.info('ListImageTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ListImage/ListImage',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('ListImageTest state pages: ' + JSON.stringify(pages));
        if (!('ListImage' == pages.name)) {
          routerInstance.replaceUrl(options);
        }
      } catch (err) {
        console.error('ListImageTest beforeEach error: ' + err);
        expect().assertFail();
      }
    });

    afterEach((): void => {
    });

    /**
     * @tc.number ListImageTest_001
     * @tc.name imageAntialiasedTrue
     * @tc.desc image.d.ets ImageAttribute.antialiased - boolean true     */
    it('imageAntialiasedTrue', Level.LEVEL1, (done: () => void) => {
      console.info('ListImageTest: imageAntialiasedTrue START');
      let strJson = inspector.getInspectorByKey('imgAntiTrue');
      expect(strJson.length > 0).assertEqual(true);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj != null).assertTrue();
      done();
    });

    /**
     * @tc.number ListImageTest_002
     * @tc.name imageAntialiasedFalse
     * @tc.desc image.d.ets ImageAttribute.antialiased - boolean false     */
    it('imageAntialiasedFalse', Level.LEVEL1, (done: () => void) => {
      console.info('ListImageTest: imageAntialiasedFalse START');
      let strJson = inspector.getInspectorByKey('imgAntiFalse');
      expect(strJson.length > 0).assertEqual(true);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj != null).assertTrue();
      done();
    });

    /**
     * @tc.number ListImageTest_003
     * @tc.name imageAntialiasedUndefined
     * @tc.desc image.d.ets ImageAttribute.antialiased - undefined     */
    it('imageAntialiasedUndefined', Level.LEVEL1, (done: () => void) => {
      console.info('ListImageTest: imageAntialiasedUndefined START');
      let strJson = inspector.getInspectorByKey('imgAntiUndef');
      expect(strJson.length > 0).assertEqual(true);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj != null).assertTrue();
      done();
    });

    /**
     * @tc.number ListImageTest_004
     * @tc.name listGlobalFunction
     * @tc.desc list.d.ets global List function - 验证 List 组件可正常渲染     */
    it('listGlobalFunction', Level.LEVEL1, (done: () => void) => {
      console.info('ListImageTest: listGlobalFunction START');
      let strJson = inspector.getInspectorByKey('listGlobal');
      expect(strJson.length > 0).assertEqual(true);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj != null).assertTrue();
      done();
    });

    /**
     * @tc.number ListImageTest_005
     * @tc.name listLanesInt
     * @tc.desc list.d.ets ListAttribute.lanes - int variant: 2     */
    it('listLanesInt', Level.LEVEL1, (done: () => void) => {
      console.info('ListImageTest: listLanesInt START');
      let strJson = inspector.getInspectorByKey('listLanesInt');
      expect(strJson.length > 0).assertEqual(true);
      let obj = JSON.parseJsonElement(strJson);
      let attrs = obj.getElement('$attrs');
      let val = attrs.getString('lanes');
      console.info('ListImageTest listLanesInt value: ' + val);
      expect(val.length > 0).assertEqual(true);
      done();
    });

    /**
     * @tc.number ListImageTest_006
     * @tc.name listLanesUndefined
     * @tc.desc list.d.ets ListAttribute.lanes - undefined variant     */
    it('listLanesUndefined', Level.LEVEL1, (done: () => void) => {
      console.info('ListImageTest: listLanesUndefined START');
      let strJson = inspector.getInspectorByKey('listLanesUndef');
      expect(strJson.length > 0).assertEqual(true);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj != null).assertTrue();
      done();
    });

    /**
     * @tc.number ListImageTest_006a
     * @tc.name listLanesGutterDimension
     * @tc.desc list.d.ets ListAttribute.lanes - gutter param: Dimension variant (10)     */
    it('listLanesGutterDimension', Level.LEVEL1, (done: () => void) => {
      console.info('ListImageTest: listLanesGutterDimension START');
      let strJson = inspector.getInspectorByKey('listLanesGutterDim');
      expect(strJson.length > 0).assertEqual(true);
      let obj = JSON.parseJsonElement(strJson);
      let attrs = obj.getElement('$attrs');
      let val = attrs.getString('lanes');
      console.info('ListImageTest listLanesGutterDimension lanes value: ' + val);
      expect(val.length > 0).assertEqual(true);
      done();
    });

    /**
     * @tc.number ListImageTest_006b
     * @tc.name listLanesGutterUndefined
     * @tc.desc list.d.ets ListAttribute.lanes - gutter param: undefined variant     */
    it('listLanesGutterUndefined', Level.LEVEL1, (done: () => void) => {
      console.info('ListImageTest: listLanesGutterUndefined START');
      let strJson = inspector.getInspectorByKey('listLanesGutterUndef');
      expect(strJson.length > 0).assertEqual(true);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj != null).assertTrue();
      done();
    });

    /**
     * @tc.number ListImageTest_007
     * @tc.name listContentStartOffsetDouble
     * @tc.desc list.d.ets ListAttribute.contentStartOffset - double variant: 10.0     */
    it('listContentStartOffsetDouble', Level.LEVEL1, (done: () => void) => {
      console.info('ListImageTest: listContentStartOffsetDouble START');
      let strJson = inspector.getInspectorByKey('listCsoDouble');
      expect(strJson.length > 0).assertEqual(true);
      let obj = JSON.parseJsonElement(strJson);
      let attrs = obj.getElement('$attrs');
      let val = attrs.getString('contentStartOffset');
      console.info('ListImageTest contentStartOffsetDouble value: ' + val);
      done();
    });

    /**
     * @tc.number ListImageTest_008
     * @tc.name listContentStartOffsetResource
     * @tc.desc list.d.ets ListAttribute.contentStartOffset - Resource variant     */
    it('listContentStartOffsetResource', Level.LEVEL1, (done: () => void) => {
      console.info('ListImageTest: listContentStartOffsetResource START');
      let strJson = inspector.getInspectorByKey('listCsoRes');
      expect(strJson.length > 0).assertEqual(true);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj != null).assertTrue();
      done();
    });

    /**
     * @tc.number ListImageTest_009
     * @tc.name listContentStartOffsetUndefined
     * @tc.desc list.d.ets ListAttribute.contentStartOffset - undefined variant     */
    it('listContentStartOffsetUndefined', Level.LEVEL1, (done: () => void) => {
      console.info('ListImageTest: listContentStartOffsetUndefined START');
      let strJson = inspector.getInspectorByKey('listCsoUndef');
      expect(strJson.length > 0).assertEqual(true);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj != null).assertTrue();
      done();
    });

    /**
     * @tc.number ListImageTest_010
     * @tc.name listContentEndOffsetDouble
     * @tc.desc list.d.ets ListAttribute.contentEndOffset - double variant: 20.0     */
    it('listContentEndOffsetDouble', Level.LEVEL1, (done: () => void) => {
      console.info('ListImageTest: listContentEndOffsetDouble START');
      let strJson = inspector.getInspectorByKey('listCeoDouble');
      expect(strJson.length > 0).assertEqual(true);
      let obj = JSON.parseJsonElement(strJson);
      let attrs = obj.getElement('$attrs');
      let val = attrs.getString('contentEndOffset');
      console.info('ListImageTest contentEndOffsetDouble value: ' + val);
      done();
    });

    /**
     * @tc.number ListImageTest_011
     * @tc.name listContentEndOffsetResource
     * @tc.desc list.d.ets ListAttribute.contentEndOffset - Resource variant     */
    it('listContentEndOffsetResource', Level.LEVEL1, (done: () => void) => {
      console.info('ListImageTest: listContentEndOffsetResource START');
      let strJson = inspector.getInspectorByKey('listCeoRes');
      expect(strJson.length > 0).assertEqual(true);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj != null).assertTrue();
      done();
    });

    /**
     * @tc.number ListImageTest_012
     * @tc.name listContentEndOffsetUndefined
     * @tc.desc list.d.ets ListAttribute.contentEndOffset - undefined variant     */
    it('listContentEndOffsetUndefined', Level.LEVEL1, (done: () => void) => {
      console.info('ListImageTest: listContentEndOffsetUndefined START');
      let strJson = inspector.getInspectorByKey('listCeoUndef');
      expect(strJson.length > 0).assertEqual(true);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj != null).assertTrue();
      done();
    });

    /**
     * @tc.number ListImageTest_013
     * @tc.name listCachedCountInt
     * @tc.desc list.d.ets ListAttribute.cachedCount - int variant: 3     */
    it('listCachedCountInt', Level.LEVEL1, (done: () => void) => {
      console.info('ListImageTest: listCachedCountInt START');
      let strJson = inspector.getInspectorByKey('listCcInt');
      expect(strJson.length > 0).assertEqual(true);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj != null).assertTrue();
      done();
    });

    /**
     * @tc.number ListImageTest_014
     * @tc.name listCachedCountUndefined
     * @tc.desc list.d.ets ListAttribute.cachedCount - undefined variant     */
    it('listCachedCountUndefined', Level.LEVEL1, (done: () => void) => {
      console.info('ListImageTest: listCachedCountUndefined START');
      let strJson = inspector.getInspectorByKey('listCcUndef');
      expect(strJson.length > 0).assertEqual(true);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj != null).assertTrue();
      done();
    });

    /**
     * @tc.number ListImageTest_014a
     * @tc.name listCachedCountShowTrue
     * @tc.desc list.d.ets ListAttribute.cachedCount - show param: boolean true     */
    it('listCachedCountShowTrue', Level.LEVEL1, (done: () => void) => {
      console.info('ListImageTest: listCachedCountShowTrue START');
      let strJson = inspector.getInspectorByKey('listCcShowTrue');
      expect(strJson.length > 0).assertEqual(true);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj != null).assertTrue();
      done();
    });

    /**
     * @tc.number ListImageTest_014b
     * @tc.name listCachedCountShowFalse
     * @tc.desc list.d.ets ListAttribute.cachedCount - show param: boolean false     */
    it('listCachedCountShowFalse', Level.LEVEL1, (done: () => void) => {
      console.info('ListImageTest: listCachedCountShowFalse START');
      let strJson = inspector.getInspectorByKey('listCcShowFalse');
      expect(strJson.length > 0).assertEqual(true);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj != null).assertTrue();
      done();
    });

    /**
     * @tc.number ListImageTest_014c
     * @tc.name listCachedCountShowUndefined
     * @tc.desc list.d.ets ListAttribute.cachedCount - show param: undefined     */
    it('listCachedCountShowUndefined', Level.LEVEL1, (done: () => void) => {
      console.info('ListImageTest: listCachedCountShowUndefined START');
      let strJson = inspector.getInspectorByKey('listCcShowUndef');
      expect(strJson.length > 0).assertEqual(true);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj != null).assertTrue();
      done();
    });

    /**
     * @tc.number ListImageTest_015
     * @tc.name listLanesLengthConstrain
     * @tc.desc list.d.ets ListAttribute.lanes - LengthConstrain variant
     *          LengthConstrain接口级参数，页面调用可能编译不通过
     *          Mode1验证LengthConstrain接口结构: minLength + maxLength
     */
    it('listLanesLengthConstrain', Level.LEVEL1, (done: () => void) => {
      console.info('ListImageTest: listLanesLengthConstrain START');
      let constrain: LengthConstrain = { minLength: 100, maxLength: 200 };
      console.info('ListImageTest LengthConstrain minLength: ' + constrain.minLength);
      console.info('ListImageTest LengthConstrain maxLength: ' + constrain.maxLength);
      expect(constrain.minLength).assertEqual(100);
      expect(constrain.maxLength).assertEqual(200);
      let constrainStr: LengthConstrain = { minLength: '50vp', maxLength: '300vp' };
      console.info('ListImageTest LengthConstrain string minLength: ' + constrainStr.minLength);
      console.info('ListImageTest LengthConstrain string maxLength: ' + constrainStr.maxLength);
      expect(constrainStr.minLength).assertEqual('50vp');
      expect(constrainStr.maxLength).assertEqual('300vp');
      console.info('ListImageTest: listLanesLengthConstrain END');
      done();
    });

    /**
     * @tc.number ListImageTest_016
     * @tc.name listLanesItemFillPolicy
     * @tc.desc list.d.ets ListAttribute.lanes - ItemFillPolicy variant
     *          ItemFillPolicy接口级参数，页面调用可能编译不通过
     *          Mode1验证ItemFillPolicy接口结构及fillType属性枚举值
     */
    it('listLanesItemFillPolicy', Level.LEVEL1, (done: () => void) => {
      console.info('ListImageTest: listLanesItemFillPolicy START');
      let policyDefault: ItemFillPolicy = { fillType: PresetFillType.BREAKPOINT_DEFAULT };
      console.info('ListImageTest ItemFillPolicy BREAKPOINT_DEFAULT: ' + policyDefault.fillType);
      expect(policyDefault.fillType).assertEqual(0);
      let policySm1: ItemFillPolicy = { fillType: PresetFillType.BREAKPOINT_SM1MD2LG3 };
      console.info('ListImageTest ItemFillPolicy BREAKPOINT_SM1MD2LG3: ' + policySm1.fillType);
      expect(policySm1.fillType).assertEqual(1);
      let policySm2: ItemFillPolicy = { fillType: PresetFillType.BREAKPOINT_SM2MD3LG5 };
      console.info('ListImageTest ItemFillPolicy BREAKPOINT_SM2MD3LG5: ' + policySm2.fillType);
      expect(policySm2.fillType).assertEqual(2);
      let policyEmpty: ItemFillPolicy = {};
      console.info('ListImageTest ItemFillPolicy empty fillType: ' + policyEmpty.fillType);
      expect(policyEmpty.fillType == undefined).assertEqual(true);
      console.info('ListImageTest: listLanesItemFillPolicy END');
      done();
    });

    /**
     * @tc.number ListImageTest_017
     * @tc.name listCachedCountCacheCountInfo
     * @tc.desc list.d.ets ListAttribute.cachedCount - CacheCountInfo variant
     *          CacheCountInfo接口级参数，页面调用可能编译不通过
     *          Mode1验证CacheCountInfo接口结构: minCount + maxCount
     */
    it('listCachedCountCacheCountInfo', Level.LEVEL1, (done: () => void) => {
      console.info('ListImageTest: listCachedCountCacheCountInfo START');
      let cacheInfo: CacheCountInfo = { minCount: 1 as int, maxCount: 5 as int };
      console.info('ListImageTest CacheCountInfo minCount: ' + cacheInfo.minCount);
      console.info('ListImageTest CacheCountInfo maxCount: ' + cacheInfo.maxCount);
      expect(cacheInfo.minCount).assertEqual(1);
      expect(cacheInfo.maxCount).assertEqual(5);
      let cacheInfo2: CacheCountInfo = { minCount: 0 as int, maxCount: 10 as int };
      console.info('ListImageTest CacheCountInfo minCount=0: ' + cacheInfo2.minCount);
      console.info('ListImageTest CacheCountInfo maxCount=10: ' + cacheInfo2.maxCount);
      expect(cacheInfo2.minCount).assertEqual(0);
      expect(cacheInfo2.maxCount).assertEqual(10);
      console.info('ListImageTest: listCachedCountCacheCountInfo END');
      done();
    });

    /**
     * @tc.number ListImageTest_018
     * @tc.name listSupportEmptyBranchInLazy
     * @tc.desc list.d.ets ListAttribute.supportEmptyBranchInLazyLoading
     *          default supportEmptyBranchInLazyLoading(supported: boolean | undefined): this;
     *          该API在设备运行时不存在(FindClass failed)，无法放到页面
     *          Mode1验证参数枚举值: true / false / undefined
     */
    it('listSupportEmptyBranchInLazy', Level.LEVEL1, (done: () => void) => {
      console.info('ListImageTest: listSupportEmptyBranchInLazy START');

      let valTrue: boolean | undefined = true;
      console.info('ListImageTest supportEmptyBranch param=true: ' + valTrue);
      expect(valTrue).assertEqual(true);
      expect(typeof valTrue).assertEqual('boolean');

      let valFalse: boolean | undefined = false;
      console.info('ListImageTest supportEmptyBranch param=false: ' + valFalse);
      expect(valFalse).assertEqual(false);
      expect(typeof valFalse).assertEqual('boolean');

      let valUndef: boolean | undefined = undefined;
      console.info('ListImageTest supportEmptyBranch param=undefined: ' + valUndef);
      expect(valUndef == undefined).assertEqual(true);

      console.info('ListImageTest: listSupportEmptyBranchInLazy END');
      done();
    });

    /**
     * @tc.number ListImageTest_019
     * @tc.name listEditModeOptions
     * @tc.desc list.d.ets ListAttribute.editModeOptions
     *          default editModeOptions(options?: EditModeOptions): this;
     *          该API在设备运行时不存在(FindClass failed)，无法放到页面
     *          Mode1验证EditModeOptions接口结构及属性值:
     *          enableGatherSelectedItemsAnimation: boolean (true/false/undefined)
     *          onGetPreviewBadge: OnGetPreviewBadgeCallback (() => boolean | int)
     */
    it('listEditModeOptions', Level.LEVEL1, (done: () => void) => {
      console.info('ListImageTest: listEditModeOptions START');

      let opts1: EditModeOptions = { enableGatherSelectedItemsAnimation: true };
      console.info('ListImageTest EditModeOptions enableGather=true: ' + opts1.enableGatherSelectedItemsAnimation);
      expect(opts1.enableGatherSelectedItemsAnimation).assertEqual(true);

      let opts2: EditModeOptions = { enableGatherSelectedItemsAnimation: false };
      console.info('ListImageTest EditModeOptions enableGather=false: ' + opts2.enableGatherSelectedItemsAnimation);
      expect(opts2.enableGatherSelectedItemsAnimation).assertEqual(false);

      let opts3: EditModeOptions = {};
      console.info('ListImageTest EditModeOptions enableGather=unset: ' + opts3.enableGatherSelectedItemsAnimation);
      expect(opts3.enableGatherSelectedItemsAnimation == undefined).assertEqual(true);

      let fnTrue: () => boolean | int = (): boolean | int => { return true; };
      let opts4: EditModeOptions = { onGetPreviewBadge: fnTrue };
      console.info('ListImageTest EditModeOptions onGetPreviewBadge set: ' + (opts4.onGetPreviewBadge != undefined));
      expect(opts4.onGetPreviewBadge != undefined).assertEqual(true);
      let r4 = fnTrue();
      console.info('ListImageTest EditModeOptions badge result (true): ' + r4);
      expect(r4).assertEqual(true);

      let fnFalse: () => boolean | int = (): boolean | int => { return false; };
      let opts5: EditModeOptions = { onGetPreviewBadge: fnFalse };
      let r5 = fnFalse();
      console.info('ListImageTest EditModeOptions badge result (false): ' + r5);
      expect(r5).assertEqual(false);

      let fnInt: () => boolean | int = (): boolean | int => { return 5 as int; };
      let opts6: EditModeOptions = { onGetPreviewBadge: fnInt };
      let r6 = fnInt();
      console.info('ListImageTest EditModeOptions badge result (int 5): ' + r6);
      expect(r6).assertEqual(5);

      let optsFull: EditModeOptions = {
        enableGatherSelectedItemsAnimation: true,
        onGetPreviewBadge: fnInt
      };
      expect(optsFull.enableGatherSelectedItemsAnimation).assertEqual(true);
      expect(optsFull.onGetPreviewBadge != undefined).assertEqual(true);

      console.info('ListImageTest: listEditModeOptions END');
      done();
    });
  });
}
