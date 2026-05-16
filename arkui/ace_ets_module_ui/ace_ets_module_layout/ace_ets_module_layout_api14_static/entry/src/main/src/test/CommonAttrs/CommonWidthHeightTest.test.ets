'use static'
/*
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
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index";
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import router from '@ohos.router';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog';
import { UtilsTest } from '../Util.test';


let domain: int = 0x0000;
let tag: string = 'CommonWidthHeightTest';

export default function CommonWidthHeightTest() {
  describe('CommonWidthHeightTest', (): void => {
    beforeAll(async () => {
      await UtilsTest.startAbility("com.arkui.ace.layout.api14.static", "EntryAbility");
      await UtilsTest.msSleep(1000);
      console.info(domain, tag, 'startAbility completed');
    });

    beforeEach(async (): Promise<void> => {
      console.info(domain, tag, 'CommonWidthHeightTest beforeEach start');
      let options: router.RouterOptions = {
        url: "MainAbility/pages/CommonAttrs/CommonWidthHeight",
      };
      try {
        const testRouter = AppStorage.get<Router>("router") as Router;
        testRouter.clear();
        let pages: router.RouterState = testRouter.getState();
        console.info(domain, tag, 'get state pages: %{public}s', JSON.stringify(pages));
        if (!("CommonWidthHeight" == pages.name)) {
          testRouter.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        hilog.error(domain, tag, 'push page error: %{public}s', JSON.stringify(err) as string);
      }
      console.info(domain, tag, 'CommonWidthHeightTest beforeEach end');
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info(domain, tag, 'CommonWidthHeightTest after each called');
    });

    /**
     * @tc.name   commonWidthHeight_0100
     * @tc.number SUB_ARKUI_COMMON_WIDTHHEIGHT_INVOKE_0100
     * @tc.desc   Test common width height invoke - verify Text component can set width and height
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('commonWidthHeight_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(domain, tag, '[commonWidthHeight_0100] START');
      let strJson = inspector.getInspectorByKey('text_width_height_invoke');
      expect(strJson).not().assertUndefined();
      let width = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('width'));
      let height = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('height'));
      console.info(domain, tag, '[commonWidthHeight_0100] width: %{public}s, height: %{public}s', width, height);
      expect(width).assertEqual('"100.00vp"');
      expect(height).assertEqual('"5.00%"');
      console.info(domain, tag, '[commonWidthHeight_0100] END');
      done();
    });

    /**
     * @tc.name   commonWidthHeight_0200
     * @tc.number SUB_ARKUI_COMMON_WIDTHHEIGHT_INVOKE_0200
     * @tc.desc   Test common width height invoke - verify Button component can set width and height
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('commonWidthHeight_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(domain, tag, '[commonWidthHeight_0200] START');
      let strJson = inspector.getInspectorByKey('button_width_height_invoke');
      expect(strJson).not().assertUndefined();
      let width = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('width'));
      let height = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('height'));
      console.info(domain, tag, '[commonWidthHeight_0200] width: %{public}s, height: %{public}s', width, height);
      expect(width).assertEqual('"100.00vp"');
      expect(height).assertEqual('"5.00%"');
      console.info(domain, tag, '[commonWidthHeight_0200] END');
      done();
    });

    /**
     * @tc.name   commonWidthHeight_0300
     * @tc.number SUB_ARKUI_COMMON_WIDTHHEIGHT_INVOKE_0300
     * @tc.desc   Test common width height invoke - verify Column component can set width and height
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('commonWidthHeight_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(domain, tag, '[commonWidthHeight_0300] START');
      let strJson = inspector.getInspectorByKey('column_width_height_invoke');
      expect(strJson).not().assertUndefined();
      let width = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('width'));
      let height = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('height'));
      console.info(domain, tag, '[commonWidthHeight_0300] width: %{public}s, height: %{public}s', width, height);
      expect(width).assertEqual('"100.00vp"');
      expect(height).assertEqual('"5.00%"');
      console.info(domain, tag, '[commonWidthHeight_0300] END');
      done();
    });

    /**
     * @tc.name   commonWidthHeight_0400
     * @tc.number SUB_ARKUI_COMMON_WIDTHHEIGHT_ARG_0100
     * @tc.desc   Test common width height arg - verify width and height with Length string '5%'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('commonWidthHeight_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(domain, tag, '[commonWidthHeight_0400] START');
      let strJson = inspector.getInspectorByKey('text_string_percent');
      expect(strJson).not().assertUndefined();
      let width = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('width'));
      let height = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('height'));
      console.info(domain, tag, '[commonWidthHeight_0400] width: %{public}s, height: %{public}s', width, height);
      expect(width).assertEqual('"5.00%"');
      expect(height).assertEqual('"5.00%"');
      console.info(domain, tag, '[commonWidthHeight_0400] END');
      done();
    });

    /**
     * @tc.name   commonWidthHeight_0500
     * @tc.number SUB_ARKUI_COMMON_WIDTHHEIGHT_ARG_0200
     * @tc.desc   Test common width height arg - verify width and height with Length string '100vp'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('commonWidthHeight_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(domain, tag, '[commonWidthHeight_0500] START');
      let strJson = inspector.getInspectorByKey('text_string_vp');
      expect(strJson).not().assertUndefined();
      let width = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('width'));
      let height = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('height'));
      console.info(domain, tag, '[commonWidthHeight_0500] width: %{public}s, height: %{public}s', width, height);
      expect(width).assertEqual('"100.00vp"');
      expect(height).assertEqual('"100.00vp"');
      console.info(domain, tag, '[commonWidthHeight_0500] END');
      done();
    });

    /**
     * @tc.name   commonWidthHeight_0600
     * @tc.number SUB_ARKUI_COMMON_WIDTHHEIGHT_ARG_0300
     * @tc.desc   Test common width height arg - verify width and height with Length string 'auto'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('commonWidthHeight_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(domain, tag, '[commonWidthHeight_0600] START');
      let strJson = inspector.getInspectorByKey('text_string_auto');
      expect(strJson).not().assertUndefined();
      let width = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('width'));
      let height = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('height'));
      console.info(domain, tag, '[commonWidthHeight_0600] width: %{public}s, height: %{public}s', width, height);
      expect(width).assertEqual('"0.00auto"');
      expect(height).assertEqual('"0.00auto"');
      console.info(domain, tag, '[commonWidthHeight_0600] END');
      done();
    });

    /**
     * @tc.name   commonWidthHeight_0700
     * @tc.number SUB_ARKUI_COMMON_WIDTHHEIGHT_ARG_0400
     * @tc.desc   Test common width height arg - verify width and height with Length number
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('commonWidthHeight_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(domain, tag, '[commonWidthHeight_0700] START');
      let strJson = inspector.getInspectorByKey('text_number');
      expect(strJson).not().assertUndefined();
      let width = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('width'));
      let height = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('height'));
      console.info(domain, tag, '[commonWidthHeight_0700] width: %{public}s, height: %{public}s', width, height);
      expect(width).assertEqual('"100.00vp"');
      expect(height).assertEqual('"100.00vp"');
      console.info(domain, tag, '[commonWidthHeight_0700] END');
      done();
    });

    /**
     * @tc.name   commonWidthHeight_0800
     * @tc.number SUB_ARKUI_COMMON_WIDTHHEIGHT_ARG_0500
     * @tc.desc   Test common width height arg - verify width and height with LayoutPolicy.wrapContent
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('commonWidthHeight_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(domain, tag, '[commonWidthHeight_0800] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('row_wrapContent_constraintSize');
      expect(strJson).not().assertUndefined();
      expect(strJson.length > 0).assertTrue();
      let width = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('width'));
      let height = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('height'));
      console.info(domain, tag, '[commonWidthHeight_0800] width: %{public}s, height: %{public}s', width, height);
      expect(width).assertEqual('"150.00vp"');
      expect(height).assertEqual('"150.00vp"');
      console.info(domain, tag, '[commonWidthHeight_0800] END');
      done();
    });

    /**
     * @tc.name   commonWidthHeight_0900
     * @tc.number SUB_ARKUI_COMMON_WIDTHHEIGHT_ARG_0600
     * @tc.desc   Test common width height arg - verify width and height with LayoutPolicy.fixAtIdealSize
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('commonWidthHeight_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(domain, tag, '[commonWidthHeight_0900] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('row_fixAtIdealSize_constraintSize');
      expect(strJson).not().assertUndefined();
      expect(strJson.length > 0).assertTrue();
      let width = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('width'));
      let height = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('height'));
      console.info(domain, tag, '[commonWidthHeight_0900] width: %{public}s, height: %{public}s', width, height);
      expect(width).assertEqual('"150.00vp"');
      expect(height).assertEqual('"150.00vp"');
      console.info(domain, tag, '[commonWidthHeight_0900] END');
      done();
    });

    /**
     * @tc.name   commonWidthHeight_1000
     * @tc.number SUB_ARKUI_COMMON_WIDTHHEIGHT_ARG_0700
     * @tc.desc   Test common width height arg - verify width and height with LayoutPolicy.wrapContent
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('commonWidthHeight_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(domain, tag, '[commonWidthHeight_1000] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('row_matchParent_constraintSize');
      expect(strJson).not().assertUndefined();
      expect(strJson.length > 0).assertTrue();
      let width = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('width'));
      let height = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('height'));
      console.info(domain, tag, '[commonWidthHeight_1000] width: %{public}s, height: %{public}s', width, height);
      expect(width).assertEqual('"150.00vp"');
      expect(height).assertEqual('"150.00vp"');
      console.info(domain, tag, '[commonWidthHeight_1000] END');
      done();
    });
  });
}