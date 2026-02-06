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
import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium'
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import Utils from '../../MainAbility/common/Utils';

export default function columnWidthsTest() {
  describe('columnWidthsTest', () => {
      beforeEach(async (done: Function) => {
      console.info('columnWidthTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textPicker/columnWidths',
      }
      console.info('columnWidchTest beforeEach End');
      try {
        router.clear();
        let pages = router.getState();
        console.info("get columnWidthTest state success " + JSON.stringify(pages));
        if (!("columnWidths" == pages.name)) {
          console.info("get columnWidthTest pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push columnWidthTest page result " + JSON.stringify(result));
        } 
      } catch (err) {
        console.error("push columnWidthTest page error " + JSON.stringify(err));
        expect().assertFail();
      }
      done()
    });
      afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('columnWidthTest after each called');
    })
    /**
     * @tc.number: columnWidthsText_0100
     * @tc.name  : columnWidthsText_0100
     * @tc.desc  : Test the columnWidths interface when the range parameter is set to a single column
     * @tc.level : Level 3
     * @tc.type
     * @tc.size
     */
    it('columnWidthsText_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
        console.info('columnWidthsText_0100 START');
        await Utils.sleep(1000); 
        let strJson = getInspectorByKey('columnWidths_001');
        let obj: ESObject = JSON.parse(strJson);
        console.info("[columnWidthsText_0100]:" + JSON.stringify(obj.$attrs.columnWidths));
        expect(obj.$attrs.columnWidths).assertEqual(vp2px(100).toFixed(2).toString() + 'px');
        await Utils.sleep(1000);
        console.info('columnWidthsText_0100 END');
        done();
      });
  
      /**
       * @tc.number: columnWidthsText_0101
       * @tc.name  : columnWidthsText_0101
       * @tc.desc  : Test the columnWidths interface when the range parameter is set to multi column
       * @tc.level : Level 3
       * @tc.type
       * @tc.size
       */
      it('columnWidthsText_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
        console.info("columnWidthsText_0101 start");
        await Utils.sleep(1000);
        let strJson = getInspectorByKey('columnWidths_002');
        let obj: ESObject = JSON.parse(strJson);
        console.info("[Testsjh_0101]:" + JSON.stringify(obj.$attrs));
        console.info("[columnWitchTest_0101]:" + JSON.stringify(obj.$attrs.columnWidths));
        let str = vp2px(20).toFixed(2).toString() + 'px,' + vp2px(40).toFixed(2).toString() + 'px,'
        + vp2px(60).toFixed(2).toString() + 'px';
        expect(obj.$attrs.columnWidths).assertEqual(str);
        await Utils.sleep(1000);
        console.info('columnWidthsText_0101 END');
        done();
      })
  
      /**
       * @tc.number: columnWidthsText_0102
       * @tc.name  : columnWidthsText_0102
       * @tc.desc  : Test the columnWidths interface when the range parameter is set to multi column
       * @tc.level : Level 3
       * @tc.type
       * @tc.size
       */
      it('columnWidthsText_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
        console.info("columnWidthsText_0102 start");
        await Utils.sleep(1000);
        let strJson = getInspectorByKey('columnWidths_003');
        let obj: ESObject = JSON.parse(strJson);
        console.info("[Testsjh_0102]:" + JSON.stringify(obj.$attrs));
        console.info("[columnWitchTest_0102]:" + JSON.stringify(obj.$attrs.columnWidths));
        let str = vp2px(112).toFixed(2).toString() + 'px,' + vp2px(112).toFixed(2).toString() + 'px,'
        + vp2px(112).toFixed(2).toString() + 'px';
        expect(obj.$attrs.columnWidths).assertEqual(str);
        await Utils.sleep(1000);
        console.info('columnWidthsText_0102 END');
        done();
      })
  
      /**
       * @tc.number: columnWidthsText_0103
       * @tc.name  : columnWidthsText_0103
       * @tc.desc  : Test the columnWidths interface when the range parameter is set to multi column
       * @tc.level : Level 3
       * @tc.type
       * @tc.size
       */
      it('columnWidthsText_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
        console.info("columnWidthsText_0103 start");
        await Utils.sleep(1000);
        let strJson = getInspectorByKey('columnWidths_004');
        let obj: ESObject = JSON.parse(strJson);
        console.info("[columnWitchTest_0103]:" + JSON.stringify(obj.$attrs.columnWidths));
        let str = vp2px(112).toFixed(2).toString() + 'px,' + vp2px(112).toFixed(2).toString() + 'px,'
        + vp2px(112).toFixed(2).toString() + 'px';
        expect(obj.$attrs.columnWidths).assertEqual(str);
        await Utils.sleep(1000);
        console.info('columnWidthsText_0103 END');
        done();
      })
  })
}