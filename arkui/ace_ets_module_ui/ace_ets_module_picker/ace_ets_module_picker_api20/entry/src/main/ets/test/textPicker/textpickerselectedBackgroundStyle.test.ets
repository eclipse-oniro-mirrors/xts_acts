/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium';
import { BY, UiDriver } from '@kit.TestKit';
import { router } from '@kit.ArkUI';
import Utils from '../../MainAbility/common/Utils';
function spliceColor(sysColor: Resource) {
  let resourceColor = getContext().resourceManager.getColorSync(sysColor.id)
  let newArgb: string =  resourceColor.toString(16).toUpperCase()
  while(newArgb.length<8){
    newArgb = '0' + newArgb
  }
  newArgb = '#' + newArgb
  return newArgb;
}

export default function TextPickerPage() {
  describe('TextPickerPage', () => {
    beforeEach(async (done: Function) => {
      console.info('TextPickerPage beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textPicker/textpickerselectedBackgroundStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get TextPickerPage state pages:' + JSON.stringify(pages));
        if (!('textpickerselectedBackgroundStyle' == pages.name)) {
          console.info('get TextPickerPage pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push TextPickerPage page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push TextPickerPage page error:' + err);
      }
      console.info('TextPickerPage beforeEach end');
      done();
    });

    /**
     * @tc.name   textPickerselectedBackgroundStyle001
     * @tc.number textPickerselectedBackgroundStyle001
     * @tc.desc   To test the selectedBackgroundStyle interface color
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textPickerselectedBackgroundStyle001', Level.LEVEL0, async (done: Function) => {
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('textPicker1');
      let obj: ESObject = JSON.parse(strJson);
      await Utils.sleep(1000);
      let obj1 :string = obj.$attrs.selectedBackgroundStyle.color;
      expect(obj1.toLowerCase()).assertEqual(Color.Red);
      done();
    });

    /**
     * @tc.name   textPickerselectedBackgroundStyle002
     * @tc.number textPickerselectedBackgroundStyle002
     * @tc.desc   To test the selectedBackgroundStyle color type is string and borderRadius type is number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textPickerselectedBackgroundStyle002', Level.LEVEL0, async (done: Function) => {
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('textPicker2');
      let obj: ESObject = JSON.parse(strJson);
      await Utils.sleep(1000);
      let obj1 :string = obj.$attrs.selectedBackgroundStyle.borderRadius;
      let obj2 :string = obj.$attrs.selectedBackgroundStyle.color;
      expect(obj1).assertEqual("radiusTopLeft: [15.00vp]radiusTopRight: [15.00vp]radiusBottomLeft: [15.00vp]radiusBottomRight: [15.00vp]");
      expect(obj2).assertEqual("#FFFFFFFF");
      done();
    });
    /**
     * @tc.name   textPickerselectedBackgroundStyle003
     * @tc.number textPickerselectedBackgroundStyle003
     * @tc.desc   To test the selectedBackgroundStyle color type is number and borderRadius type is string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textPickerselectedBackgroundStyle003', Level.LEVEL0, async (done: Function) => {
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('textPicker3');
      let obj: ESObject = JSON.parse(strJson);
      await Utils.sleep(1000);
      let obj1 :string = obj.$attrs.selectedBackgroundStyle.borderRadius;
      let obj2 :string = obj.$attrs.selectedBackgroundStyle.color;
      expect(obj1).assertEqual("radiusTopLeft: [15.00vp]radiusTopRight: [15.00vp]radiusBottomLeft: [15.00vp]radiusBottomRight: [15.00vp]");
      expect(obj2).assertEqual("#FFFFFFFF");
      done();
    });
    /**
     * @tc.name   textPickerselectedBackgroundStyle004
     * @tc.number textPickerselectedBackgroundStyle004
     * @tc.desc   To test the selectedBackgroundStyle color and borderRadius type is resource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textPickerselectedBackgroundStyle004', Level.LEVEL0, async (done: Function) => {
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('textPicker4');
      let obj: ESObject = JSON.parse(strJson);
      await Utils.sleep(1000);
      let obj1 :string = obj.$attrs.selectedBackgroundStyle.borderRadius;
      let obj2 :string = obj.$attrs.selectedBackgroundStyle.color;
      expect(obj1).assertEqual("radiusTopLeft: [24.00vp]radiusTopRight: [24.00vp]radiusBottomLeft: [24.00vp]radiusBottomRight: [24.00vp]");
      expect(obj2).assertEqual("#FFFFFFFF");
      done();
    });
    /**
     * @tc.name   textPickerselectedBackgroundStyle005
     * @tc.number textPickerselectedBackgroundStyle005
     * @tc.desc   To test the selectedBackgroundStyle color and borderRadius type is undefine
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textPickerselectedBackgroundStyle005', Level.LEVEL0, async (done: Function) => {
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('textPicker5');
      let obj: ESObject = JSON.parse(strJson);
      await Utils.sleep(1000);
      let obj1 :string = obj.$attrs.selectedBackgroundStyle.borderRadius;
      let obj2 :string = obj.$attrs.selectedBackgroundStyle.color;
      expect(obj1).assertEqual("radiusTopLeft: [24.00vp]radiusTopRight: [24.00vp]radiusBottomLeft: [24.00vp]radiusBottomRight: [24.00vp]");
      expect(obj2).assertEqual(spliceColor($r('sys.color.comp_background_tertiary')));
      done();
    });
  })
}