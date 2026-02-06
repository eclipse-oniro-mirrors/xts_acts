/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
 import { describe, TestType, Size, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium';
 import { BY, UiDriver } from '@kit.TestKit';
 import { router } from '@kit.ArkUI';
 import Utils from '../../MainAbility/common/Utils';
 import { Driver, ON, } from '@ohos.UiTest';
 import { Want } from '@kit.AbilityKit';

 export default function selectModifier() {
   describe('selectModifier', () => {
     beforeEach(async (done: Function) => {
       console.info('selectModifier beforeEach start');
       let options: router.RouterOptions = {
         url: 'MainAbility/pages/select/selectModifier',
       }
       try {
         router.clear();
         let pages = router.getState();
         console.info('get selectModifier state pages:' + JSON.stringify(pages));
         if (!('selectModifier' == pages.name)) {
           console.info('get selectModifier pages.name:' + JSON.stringify(pages.name));
           let result = await router.pushUrl(options);
           await Utils.sleep(2500);
           console.info('push selectModifier page result:' + JSON.stringify(result));
         }
       } catch (err) {
         console.error('push selectModifier page error:' + err);
       }
       console.info('selectModifier beforeEach end');
       done();
     });
 
    /**
     * @tc.number: testSelectModifier001
     * @tc.name  : testSelectModifier001
     * @tc.desc  : To test the textModifier interface fontSize value is '50vp'
     *             To test the textModifier interface fontColor value is '#FFFF1235'
     *             To test the textModifier interface maxLines value is '2'
     * @tc.level : Level 0
     * @tc.type  : TestType.FUNCTION
     * @tc.size  : Size.MEDIUMTEST
     */
    it('testSelectModifier001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[testSelectModifier001] START');
      let node: string = getInspectorByKey('Select');
      console.info('[testSelectModifier001]:' + node);

      let size: string = JSON.parse(JSON.parse(node).$attrs.font).size;
      console.info('[testSelectModifier001] size:' + size);
      expect(size).assertEqual('50.00vp');

      let fontColor: string = JSON.parse(node).$attrs.fontColor;
      console.info('[testSelectModifier002] fontColor:' + fontColor);
      expect(fontColor).assertEqual('#FFFF1235');

      let maxLines: string = JSON.parse(node).$attrs.maxLines;
      console.info('[testSelectModifier003] maxLines:' + maxLines);
      expect(maxLines).assertEqual('2');
      console.info('[testSelectModifier001] END');
      done();
    })

    /**
     * @tc.number: testSelectModifier002
     * @tc.name  : testSelectModifier002
     * @tc.desc  : To test the selectedOptionTextModifier interface selectedOptionFont value is '51.00vp'
     *             To test the selectedOptionTextModifier interface selectedOptionFontColor value is '#FFFF1236'
     *             To test the selectedOptionTextModifier interface selectedOptionMaxLines value is '3'
     * @tc.level : Level 0
     * @tc.type  : TestType.FUNCTION
     * @tc.size  : Size.MEDIUMTEST
     */
    it('testSelectModifier002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[testSelectModifier002] START');
      let node: string = getInspectorByKey('Select');
      console.info('[testSelectModifier002]:' + node);
      let size: string = JSON.parse(JSON.parse(node).$attrs.selectedOptionFont).size;
      console.info('[testSelectModifier002] size:' + size);
      expect(size).assertEqual('51.00vp');

      let selectedOptionFontColor: string = JSON.parse(node).$attrs.selectedOptionFontColor;
      console.info('[testSelectModifier002] selectedOptionFontColor:' + selectedOptionFontColor);
      expect(selectedOptionFontColor).assertEqual('#FFFF1236');

      let selectedOptionMaxLines: string = JSON.parse(node).$attrs.selectedOptionMaxLines;
      console.info('[testSelectModifier002] selectedOptionMaxLines:' + selectedOptionMaxLines);
      expect(selectedOptionMaxLines).assertEqual('3');
      console.info('[testSelectModifier002] END');
      done();
    })

    /**
     * @tc.number: testSelectModifier003
     * @tc.name  : testSelectModifier003
     * @tc.desc  : To test the optionTextModifier interface optionFont value is '52.00vp'
     *             To test the optionTextModifier interface optionFontColor value is '#FFFF1237'
     *             To test the optionTextModifier interface optionMaxLines value is '4'
     * @tc.level : Level 0
     * @tc.type  : TestType.FUNCTION
     * @tc.size  : Size.MEDIUMTEST
     */
    it('testSelectModifier003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[testSelectModifier003] START');
      let node: string = getInspectorByKey('Select');
      console.info('[testSelectModifier003]:' + node);
      let size: string = JSON.parse(JSON.parse(node).$attrs.optionFont).size;
      console.info('[testSelectModifier003] size:' + size);
      expect(size).assertEqual('52.00vp');

      let optionFontColor: string = JSON.parse(node).$attrs.optionFontColor;
      console.info('[testSelectModifier003] optionFontColor:' + optionFontColor);
      expect(optionFontColor).assertEqual('#FFFF1237');

      let optionMaxLines: string = JSON.parse(node).$attrs.optionMaxLines;
      console.info('[testSelectModifier003] optionMaxLines:' + optionMaxLines);
      expect(optionMaxLines).assertEqual('4');
      console.info('[testSelectModifier003] END');
      done();
    })

    /**
     * @tc.number: testSelectModifier004
     * @tc.name  : testSelectModifier004
     * @tc.desc  : To test the SymbolGlyphModifier interface symbolColorList value is '#FFFF1238, #FFFF1238, #FFFF1238'
     *             To test the SymbolGlyphModifier interface symbolFontSize value is '53.00vp'
     * @tc.level : Level 0
     * @tc.type  : TestType.FUNCTION
     * @tc.size  : Size.MEDIUMTEST
     */
    it('testSelectModifier004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[testSelectModifier004] START');
      let node: string = getInspectorByKey('Select');
      console.info('[testSelectModifier004]:' + node);
      let symbolColorList: string = JSON.parse(node).$attrs.symbolColorList;
      console.info('[testSelectModifier004] symbolColorList:' + symbolColorList);
      expect(symbolColorList).assertEqual('#FFFF1238, #FFFF1238, #FFFF1238');

      let symbolFontSize: string = JSON.parse(node).$attrs.symbolFontSize;
      console.info('[testSelectModifier004] symbolFontSize:' + symbolFontSize);
      expect(symbolFontSize).assertEqual('53.00vp');
      console.info('[testSelectModifier004] END');
      done();
    })

    /**
     * @tc.number: testSelectModifier005
     * @tc.name  : testSelectModifier005
     * @tc.desc  : To test the textModifier interface font value is undefined
     * @tc.level : Level 2
     * @tc.type  : TestType.FUNCTION
     * @tc.size  : Size.MEDIUMTEST
     */
    it('testSelectModifier005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('[testSelectModifier005] START');
      let node: string = getInspectorByKey('Select2');
      console.info('[testSelectModifier005]:' + node);
      let value: string = JSON.parse(JSON.parse(node).$attrs.font).size;
      console.info('[testSelectModifier005] value:' + value);
      expect(value).assertEqual('40.00vp');
      console.info('[testSelectModifier005] END');
      done();
    })

    /**
     * @tc.number: testSelectModifier006
     * @tc.name  : testSelectModifier006
     * @tc.desc  : To test the selectedOptionTextModifier interface selectedOptionFont value is undefined
     * @tc.level : Level 2
     * @tc.type  : TestType.FUNCTION
     * @tc.size  : Size.MEDIUMTEST
     */
    it('testSelectModifier006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('[testSelectModifier006] START');
      let node: string = getInspectorByKey('Select2');
      console.info('[testSelectModifier006]:' + node);
      let value: string = JSON.parse(JSON.parse(node).$attrs.selectedOptionFont).size;
      console.info('[testSelectModifier006] value:' + value);
      expect(value).assertEqual('41.00vp');
      console.info('[testSelectModifier006] END');
      done();
    })

    /**
     * @tc.number: testSelectModifier007
     * @tc.name  : testSelectModifier007
     * @tc.desc  : To test the optionTextModifier interface optionFont value is undefined
     * @tc.level : Level 2
     * @tc.type  : TestType.FUNCTION
     * @tc.size  : Size.MEDIUMTEST
     */
    it('testSelectModifier007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('[testSelectModifier007] START');
      let node: string = getInspectorByKey('Select2');
      console.info('[testSelectModifier007]:' + node);
      let value: string = JSON.parse(JSON.parse(node).$attrs.optionFont).size;
      console.info('[testSelectModifier007] value:' + value);
      expect(value).assertEqual('42.00vp');
      console.info('[testSelectModifier007] END');
      done();
    })

    /**
     * @tc.number: testSelectModifier008
     * @tc.name  : testSelectModifier008
     * @tc.desc  : To test the arrowModifier interface font symbolFontSize is undefined
     * @tc.level : Level 2
     * @tc.type  : TestType.FUNCTION
     * @tc.size  : Size.MEDIUMTEST
     */
    it('testSelectModifier008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('[testSelectModifier008] START');
      let node: string = getInspectorByKey('Select2');
      console.info('[testSelectModifier008]:' + node);
      let value: string = JSON.parse(node).$attrs.symbolFontSize;
      console.info('[testSelectModifier008] value:' + value);
      expect(value).assertEqual(undefined);
      console.info('[testSelectModifier008] END');
      done();
    })
 })
}