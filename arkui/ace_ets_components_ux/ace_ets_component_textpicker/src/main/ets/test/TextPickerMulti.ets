/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeEach, afterEach, it, expect } from '@ohos/hypium'
import router from '@ohos.router';

export default function textpickermultiTest() {
  describe('ActsTextPickerTest', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: "TestAbility/pages/TextPickerMulti",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextPickerMulti state success " + JSON.stringify(pages));
        if (!("TextPickerMulti" == pages.name)) {
          console.info("get TextPickerMulti state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push TextPickerMulti page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextPickerMulti page error " + JSON.stringify(err));
      }
      done()
    });

    /**
     * @tc.number ArkUXII_Stage_TextPicker_Options_0100
     * @tc.name Test the multi column properties of the textpick component
     * @tc.desc Set the range parameter to multiple columns
     */
    it('ArkUXII_Stage_TextPicker_Options_0100', 0, async (done: Function) => {
      console.info("ArkUXII_Stage_TextPicker_Options_0100 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('textpicker_1');
          let obj: ESObject = JSON.parse(strJson);
          console.info("[ArkUXII_Stage_TextPicker_Options_0100]:" + JSON.stringify(obj.$attrs.range));
          expect(obj.$attrs.range).assertEqual('[["apple1","apple2","apple3","apple4"],' +
            '["orange1","orange2","orange3","orange4"],["peach1","peach2","peach3","peach4"]]');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_TextPicker_Options_0100 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number ArkUXII_Stage_TextPicker_Options_0200
     * @tc.name Test the multi column properties of the textpick component
     * @tc.desc Set the range parameter to multiple columns linkage
     */
    it('ArkUXII_Stage_TextPicker_Options_0200', 0, async (done: Function) => {
      console.info("ArkUXII_Stage_TextPicker_Options_0200 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('textpicker_2');
          let obj: ESObject = JSON.parse(strJson);
          console.info("[ArkUXII_Stage_TextPicker_Options_0200]:" + JSON.stringify(obj.$attrs.range));
          expect(obj.$attrs.range).assertEqual('[{"text":"辽宁省",' +
            ' "children":[{"text":"沈阳市", "children":[{"text":"沈河区"},{"text":"和平区"},{"text":"浑南区"}]},' +
            '{"text":"大连市", "children":[{"text":"中山区"},{"text":"金州区"},{"text":"长海县"}]}]},' +
            '{"text":"吉林省", "children":[{"text":"长春市", "children":[{"text":"南关区"},{"text":"宽城区"},' +
            '{"text":"朝阳区"}]},{"text":"四平市", "children":[{"text":"铁西区"},{"text":"铁东区"},{"text":"梨树县"}]}]},' +
            '{"text":"黑龙江省", "children":[{"text":"哈尔滨市", "children":[{"text":"道里区"},{"text":"道外区"},' +
            '{"text":"南岗区"}]},{"text":"牡丹江市", "children":[{"text":"东安区"},{"text":"西安区"},{"text":"爱民区"}]}]}]');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_TextPicker_Options_0200 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number ArkUXII_Stage_TextPicker_Options_0300
     * @tc.name Test the multi column properties of the textpick component
     * @tc.desc Set the selected parameter to [1, 1, 2]
     */
    it('ArkUXII_Stage_TextPicker_Options_0300', 0, async (done: Function) => {
      console.info("ArkUXII_Stage_TextPicker_Options_0300 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('textpicker_3');
          let obj: ESObject = JSON.parse(strJson);
          console.info("[ArkUXII_Stage_TextPicker_Options_0300]:" + JSON.stringify(obj.$attrs.selecteds));
          expect(obj.$attrs.selecteds[0]).assertEqual('1');
          expect(obj.$attrs.selecteds[1]).assertEqual('1');
          expect(obj.$attrs.selecteds[2]).assertEqual('2');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_TextPicker_Options_0300 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number ArkUXII_Stage_TextPicker_Options_0400
     * @tc.name Test the multi column properties of the textpick component
     * @tc.desc Set the value parameter to  ["辽宁省", "大连市","中山区"]
     */
    it('ArkUXII_Stage_TextPicker_Options_0400', 0, async (done: Function) => {
      console.info("ArkUXII_Stage_TextPicker_Options_0400 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('textpicker_4');
          let obj: ESObject = JSON.parse(strJson);
          console.info("[ArkUXII_Stage_TextPicker_Options_0400]:" + JSON.stringify(obj.$attrs.values));
          expect(obj.$attrs.values[0]).assertEqual('辽宁省');
          expect(obj.$attrs.values[1]).assertEqual('大连市');
          expect(obj.$attrs.values[2]).assertEqual('中山区');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_TextPicker_Options_0400 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number ArkUXII_Stage_TextPicker_Options_0500
     * @tc.name Test the multi column properties of the textpick component
     * @tc.desc Set the selectedIndex parameter to  [2, 1, 2]
     */
    it('ArkUXII_Stage_TextPicker_Options_0500', 0, async (done: Function) => {
      console.info("ArkUXII_Stage_TextPicker_Options_0500 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('textpicker_5');
          let obj: ESObject = JSON.parse(strJson);
          console.info("[ArkUXII_Stage_TextPicker_Options_0500]:" + JSON.stringify(obj.$attrs.selectedIndex));
          expect(obj.$attrs.selectedIndex[0]).assertEqual('2');
          expect(obj.$attrs.selectedIndex[1]).assertEqual('1');
          expect(obj.$attrs.selectedIndex[2]).assertEqual('2');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_TextPicker_Options_0500 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number ArkUXII_Stage_TextPicker_Options_0600
     * @tc.name Test the multi column properties of the textpick component
     * @tc.desc Simultaneously setting the selectedIndex selected value parameter
     */
    it('ArkUXII_Stage_TextPicker_Options_0600', 0, async (done: Function) => {
      console.info("ArkUXII_Stage_TextPicker_Options_0600 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('textpicker_6');
          let obj: ESObject = JSON.parse(strJson);
          console.info("[ArkUXII_Stage_TextPicker_Options_0600]:" + JSON.stringify(obj.$attrs.selectedIndex));
          expect(obj.$attrs.selectedIndex[0]).assertEqual('0');
          expect(obj.$attrs.selectedIndex[1]).assertEqual('1');
          expect(obj.$attrs.selectedIndex[2]).assertEqual('2');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_TextPicker_Options_0600 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number ArkUXII_Stage_TextPicker_Options_0700
     * @tc.name Test the multi column properties of the textpick component
     * @tc.desc Set the selectedIndex parameter to  [null, 1, 1]
     */
    it('ArkUXII_Stage_TextPicker_Options_0700', 0, async (done: Function) => {
      console.info("ArkUXII_Stage_TextPicker_Options_0700 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('textpicker_7');
          let obj: ESObject = JSON.parse(strJson);
          console.info("[ArkUXII_Stage_TextPicker_Options_0700]:" + JSON.stringify(obj.$attrs.selectedIndex));
          expect(obj.$attrs.selectedIndex[0]).assertEqual('0');
          expect(obj.$attrs.selectedIndex[1]).assertEqual('0');
          expect(obj.$attrs.selectedIndex[2]).assertEqual('0');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_TextPicker_Options_0700 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number ArkUXII_Stage_TextPicker_Options_0800
     * @tc.name Test the multi column properties of the textpick component
     * @tc.desc Set the selectedIndex parameter to  [1, undefined, 1]
     */
    it('ArkUXII_Stage_TextPicker_Options_0800', 0, async (done: Function) => {
      console.info("ArkUXII_Stage_TextPicker_Options_0800 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('textpicker_8');
          let obj: ESObject = JSON.parse(strJson);
          console.info("[ArkUXII_Stage_TextPicker_Options_0800]:" + JSON.stringify(obj.$attrs.selectedIndex));
          expect(obj.$attrs.selectedIndex[0]).assertEqual('0');
          expect(obj.$attrs.selectedIndex[1]).assertEqual('0');
          expect(obj.$attrs.selectedIndex[2]).assertEqual('0');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_TextPicker_Options_0800 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number ArkUXII_Stage_TextPicker_Options_0900
     * @tc.name Test the multi column properties of the textpick component
     * @tc.desc Set the selectedIndex parameter to  [1, 1, '']
     */
    it('ArkUXII_Stage_TextPicker_Options_0900', 0, async (done: Function) => {
      console.info("ArkUXII_Stage_TextPicker_Options_0900 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('textpicker_9');
          let obj: ESObject = JSON.parse(strJson);
          console.info("[ArkUXII_Stage_TextPicker_Options_0900]:" + JSON.stringify(obj.$attrs.selectedIndex));
          expect(obj.$attrs.selectedIndex[0]).assertEqual('0');
          expect(obj.$attrs.selectedIndex[1]).assertEqual('0');
          expect(obj.$attrs.selectedIndex[2]).assertEqual('0');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_TextPicker_Options_0900 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number ArkUXII_Stage_TextPicker_Options_1000
     * @tc.name Test the multi column properties of the textpick component
     * @tc.desc Set the selected parameter to  [1, 0, ]
     */
    it('ArkUXII_Stage_TextPicker_Options_1000', 0, async (done: Function) => {
      console.info("ArkUXII_Stage_TextPicker_Options_1000 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('textpicker_10');
          let obj: ESObject = JSON.parse(strJson);
          console.info("[ArkUXII_Stage_TextPicker_Options_1000]:" + JSON.stringify(obj.$attrs.selecteds));
          expect(obj.$attrs.selecteds[0]).assertEqual('1');
          expect(obj.$attrs.selecteds[1]).assertEqual('0');
          expect(obj.$attrs.selecteds[2]).assertEqual('0');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_TextPicker_Options_1000 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number ArkUXII_Stage_TextPicker_Options_1100
     * @tc.name Test the multi column properties of the textpick component
     * @tc.desc Set the value parameter to  ['辽宁省', '大连市', '']
     */
    it('ArkUXII_Stage_TextPicker_Options_1100', 0, async (done: Function) => {
      console.info("ArkUXII_Stage_TextPicker_Options_1100 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('textpicker_11');
          let obj: ESObject = JSON.parse(strJson);
          console.info("[ArkUXII_Stage_TextPicker_Options_1100]:" + JSON.stringify(obj.$attrs.values));
          expect(obj.$attrs.values[0]).assertEqual('辽宁省');
          expect(obj.$attrs.values[1]).assertEqual('大连市');
          expect(obj.$attrs.values[2]).assertEqual('中山区');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_TextPicker_Options_1100 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });
  })
}
