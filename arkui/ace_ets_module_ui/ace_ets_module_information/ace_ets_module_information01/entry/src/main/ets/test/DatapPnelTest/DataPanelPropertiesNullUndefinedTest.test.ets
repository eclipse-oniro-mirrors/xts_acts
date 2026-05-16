/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import CommonFunc from '../../MainAbility/common/Common';

export default function DataPanelPropertiesNullUndefinedTest() {
  describe('DataPanelPropertiesNullUndefinedTest', () => {
    beforeAll(async () => {
      console.info("DataPanelPropertiesNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DataPanel/DataPanelPropertiesNullUndefinedTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get gauge state success " + JSON.stringify(pages));
        if (!("DataPanelPropertiesNullUndefinedTest" == pages.name)) {
          console.info("get DataPanelPropertiesNullUndefinedTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push DataPanelPropertiesNullUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DataPanelPropertiesNullUndefinedTest page error: " + err);
      }
    });

    /**
     * @tc.name   dataPanelValueColors_null_0100
     * @tc.number SUB_ARKUI_DATAPANEL_VALUECOLORS_NULL_0100
     * @tc.desc   Test DataPanel valueColors property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('dataPanelValueColors_null_0100', Level.LEVEL0, async () => {
      console.info('[dataPanelValueColors_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('DataPanel_valueColors_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('DataPanel_valueColors_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[dataPanelValueColors_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[dataPanelValueColors_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[dataPanelValueColors_null_0100] default valueColors is: " + JSON.stringify(objCompare.$attrs.valueColors));
      console.info("[dataPanelValueColors_null_0100] null valueColors is: " + JSON.stringify(obj.$attrs.valueColors));

      // null 应该恢复为默认值
      expect(JSON.stringify(obj.$attrs.valueColors)).assertEqual(JSON.stringify(objCompare.$attrs.valueColors));
      console.info('[dataPanelValueColors_null_0100] END');
    })

    /**
     * @tc.name   dataPanelValueColors_undefined_0100
     * @tc.number SUB_ARKUI_DATAPANEL_VALUECOLORS_UNDEFINED_0100
     * @tc.desc   Test DataPanel valueColors property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('dataPanelValueColors_undefined_0100', Level.LEVEL0, async () => {
      console.info('[dataPanelValueColors_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('DataPanel_valueColors_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('DataPanel_valueColors_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[dataPanelValueColors_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[dataPanelValueColors_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[dataPanelValueColors_undefined_0100] default valueColors is: " + JSON.stringify(objCompare.$attrs.valueColors));
      console.info("[dataPanelValueColors_undefined_0100] undefined valueColors is: " + JSON.stringify(obj.$attrs.valueColors));

      // undefined 应该恢复为默认值
      expect(JSON.stringify(obj.$attrs.valueColors)).assertEqual(JSON.stringify(objCompare.$attrs.valueColors));
      console.info('[dataPanelValueColors_undefined_0100] END');
    })

    /**
     * @tc.name   dataPanelValueColors_empty_0100
     * @tc.number SUB_ARKUI_DATAPANEL_VALUECOLORS_EMPTY_0100
     * @tc.desc   Test DataPanel valueColors property with empty array, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('dataPanelValueColors_empty_0100', Level.LEVEL0, async () => {
      console.info('[dataPanelValueColors_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('DataPanel_valueColors_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('DataPanel_valueColors_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[dataPanelValueColors_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[dataPanelValueColors_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[dataPanelValueColors_empty_0100] default valueColors is: " + JSON.stringify(objCompare.$attrs.valueColors));
      console.info("[dataPanelValueColors_empty_0100] empty valueColors is: " + JSON.stringify(obj.$attrs.valueColors));

      // 空数组 应该恢复为默认值
      expect(JSON.stringify(obj.$attrs.valueColors)).assertEqual('[]');
      console.info('[dataPanelValueColors_empty_0100] END');
    })

    /**
     * @tc.name   dataPanelTrackShadow_null_0100
     * @tc.number SUB_ARKUI_DATAPANEL_TRACKSHADOW_NULL_0100
     * @tc.desc   Test DataPanel trackShadow property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('dataPanelTrackShadow_null_0100', Level.LEVEL0, async () => {
      console.info('[dataPanelTrackShadow_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('DataPanel_trackShadow_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('DataPanel_trackShadow_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[dataPanelTrackShadow_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[dataPanelTrackShadow_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[dataPanelTrackShadow_null_0100] default trackShadow is: " + JSON.stringify(objCompare.$attrs.trackShadow));
      console.info("[dataPanelTrackShadow_null_0100] null trackShadow is: " + JSON.stringify(obj.$attrs.trackShadow));

      // null 应该恢复为默认值
      expect(obj.$attrs.trackShadow).assertEqual('null');
      console.info('[dataPanelTrackShadow_null_0100] END');
    })

    /**
     * @tc.name   dataPanelTrackShadow_undefined_0100
     * @tc.number SUB_ARKUI_DATAPANEL_TRACKSHADOW_UNDEFINED_0100
     * @tc.desc   Test DataPanel trackShadow property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('dataPanelTrackShadow_undefined_0100', Level.LEVEL0, async () => {
      console.info('[dataPanelTrackShadow_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('DataPanel_trackShadow_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('DataPanel_trackShadow_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[dataPanelTrackShadow_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[dataPanelTrackShadow_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[dataPanelTrackShadow_undefined_0100] default trackShadow is: " + JSON.stringify(objCompare.$attrs.trackShadow));
      console.info("[dataPanelTrackShadow_undefined_0100] undefined trackShadow is: " + JSON.stringify(obj.$attrs.trackShadow));

      // undefined 应该恢复为默认值
      expect( JSON.stringify(obj.$attrs.trackShadow)).assertEqual(JSON.stringify(objCompare.$attrs.trackShadow));
      console.info('[dataPanelTrackShadow_undefined_0100] END');
    })

    /**
     * @tc.name   dataPanelContentModifier_null_0100
     * @tc.number SUB_ARKUI_DATAPANEL_CONTENTMODIFIER_NULL_0100
     * @tc.desc   Test DataPanel contentModifier property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('dataPanelContentModifier_null_0100', Level.LEVEL0, async () => {
      console.info('[dataPanelContentModifier_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('DataPanel_contentModifier_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('DataPanel_contentModifier_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[dataPanelContentModifier_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[dataPanelContentModifier_null_0100] null obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$type).assertEqual(objCompare.$type);
      console.info('[dataPanelContentModifier_null_0100] END');
    })

    /**
     * @tc.name   dataPanelContentModifier_undefined_0100
     * @tc.number SUB_ARKUI_DATAPANEL_CONTENTMODIFIER_UNDEFINED_0100
     * @tc.desc   Test DataPanel contentModifier property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('dataPanelContentModifier_undefined_0100', Level.LEVEL0, async () => {
      console.info('[dataPanelContentModifier_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('DataPanel_contentModifier_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('DataPanel_contentModifier_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[dataPanelContentModifier_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[dataPanelContentModifier_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$type).assertEqual(objCompare.$type);
      console.info('[dataPanelContentModifier_undefined_0100] END');
    })
  })
}
