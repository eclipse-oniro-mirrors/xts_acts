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

import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';

export default function FolderStackNullUndefinedTest() {
  describe('FolderStackNullUndefinedTest', () => {
    beforeAll(async (done: Function) => {
      console.info("FolderStackNullUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FolderStack/FolderStackNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get FolderStackNullUndefined state pages:" + JSON.stringify(pages));
        if (!("FolderStackNullUndefined" == pages.name)) {
          console.info("get FolderStackNullUndefined pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push FolderStackNullUndefined page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FolderStackNullUndefined page error:" + err);
      }
      console.info("FolderStackNullUndefined beforeEach end");
      done();
    });

    /**
     * @tc.name   folderStackAlignContentNull_0100
     * @tc.number SUB_ARKUI_FOLDERSTACK_ALIGNCONTENT_NULL_0100
     * @tc.desc   Test FolderStack alignContent method with null parameter, should be treated as default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('folderStackAlignContentNull_0100', Level.LEVEL0, async () => {
      console.info('[folderStackAlignContentNull_0100] START');

      let strJson = getInspectorByKey('folderstack_aligncontent_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.alignContent).assertEqual('Alignment.Center');
      console.info('[folderStackAlignContentNull_0100] END');
    })

    /**
     * @tc.name   folderStackAlignContentUndefined_0100
     * @tc.number SUB_ARKUI_FOLDERSTACK_ALIGNCONTENT_UNDEFINED_0100
     * @tc.desc   Test FolderStack alignContent method with undefined parameter, should be treated as default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('folderStackAlignContentUndefined_0100', Level.LEVEL0, async () => {
      console.info('[folderStackAlignContentUndefined_0100] START');

      let strJson = getInspectorByKey('folderstack_aligncontent_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.alignContent).assertEqual('Alignment.Center');
      console.info('[folderStackAlignContentUndefined_0100] END');
    })

    /**
     * @tc.name   folderStackAlignContentValid_0100
     * @tc.number SUB_ARKUI_FOLDERSTACK_ALIGNCONTENT_VALID_0100
     * @tc.desc   Test FolderStack alignContent method with valid Alignment.TopStart parameter, should work correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('folderStackAlignContentValid_0100', Level.LEVEL0, async () => {
      console.info('[folderStackAlignContentValid_0100] START');

      let strJson = getInspectorByKey('folderstack_aligncontent_valid');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.alignContent).assertEqual('Alignment.TopStart');
      console.info('[folderStackAlignContentValid_0100] END');
    })

    /**
     * @tc.name   folderStackEnableAnimationNull_0100
     * @tc.number SUB_ARKUI_FOLDERSTACK_ENABLEANIMATION_NULL_0100
     * @tc.desc   Test FolderStack enableAnimation method with null parameter, should be treated as default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('folderStackEnableAnimationNull_0100', Level.LEVEL0, async () => {
      console.info('[folderStackEnableAnimationNull_0100] START');

      let strJson = getInspectorByKey('folderstack_enableanimation_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.enableAnimation).assertEqual('true');
      console.info('[folderStackEnableAnimationNull_0100] END');
    })

    /**
     * @tc.name   folderStackEnableAnimationUndefined_0100
     * @tc.number SUB_ARKUI_FOLDERSTACK_ENABLEANIMATION_UNDEFINED_0100
     * @tc.desc   Test FolderStack enableAnimation method with undefined parameter, should be treated as default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('folderStackEnableAnimationUndefined_0100', Level.LEVEL0, async () => {
      console.info('[folderStackEnableAnimationUndefined_0100] START');

      let strJson = getInspectorByKey('folderstack_enableanimation_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.enableAnimation).assertEqual('true');
      console.info('[folderStackEnableAnimationUndefined_0100] END');
    })

    /**
     * @tc.name   folderStackEnableAnimationTrue_0100
     * @tc.number SUB_ARKUI_FOLDERSTACK_ENABLEANIMATION_TRUE_0100
     * @tc.desc   Test FolderStack enableAnimation method with valid true parameter, should work correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('folderStackEnableAnimationTrue_0100', Level.LEVEL0, async () => {
      console.info('[folderStackEnableAnimationTrue_0100] START');

      let strJson = getInspectorByKey('folderstack_enableanimation_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.enableAnimation).assertEqual('true');
      console.info('[folderStackEnableAnimationTrue_0100] END');
    })

    /**
     * @tc.name   folderStackEnableAnimationFalse_0100
     * @tc.number SUB_ARKUI_FOLDERSTACK_ENABLEANIMATION_FALSE_0100
     * @tc.desc   Test FolderStack enableAnimation method with false parameter, should work correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('folderStackEnableAnimationFalse_0100', Level.LEVEL0, async () => {
      console.info('[folderStackEnableAnimationFalse_0100] START');

      let strJson = getInspectorByKey('folderstack_enableanimation_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.enableAnimation).assertEqual('false');
      console.info('[folderStackEnableAnimationFalse_0100] END');
    })

    /**
     * @tc.name   folderStackAutoHalfFoldNull_0100
     * @tc.number SUB_ARKUI_FOLDERSTACK_AUTOHALFFOLD_NULL_0100
     * @tc.desc   Test FolderStack autoHalfFold method with null parameter, should be treated as default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('folderStackAutoHalfFoldNull_0100', Level.LEVEL0, async () => {
      console.info('[folderStackAutoHalfFoldNull_0100] START');

      let strJson = getInspectorByKey('folderstack_autohalffold_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.autoHalfFold).assertEqual('true');
      console.info('[folderStackAutoHalfFoldNull_0100] END');
    })

    /**
     * @tc.name   folderStackAutoHalfFoldUndefined_0100
     * @tc.number SUB_ARKUI_FOLDERSTACK_AUTOHALFFOLD_UNDEFINED_0100
     * @tc.desc   Test FolderStack autoHalfFold method with undefined parameter, should be treated as default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('folderStackAutoHalfFoldUndefined_0100', Level.LEVEL0, async () => {
      console.info('[folderStackAutoHalfFoldUndefined_0100] START');

      let strJson = getInspectorByKey('folderstack_autohalffold_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.autoHalfFold).assertEqual('true');
      console.info('[folderStackAutoHalfFoldUndefined_0100] END');
    })

    /**
     * @tc.name   folderStackAutoHalfFoldTrue_0100
     * @tc.number SUB_ARKUI_FOLDERSTACK_AUTOHALFFOLD_TRUE_0100
     * @tc.desc   Test FolderStack autoHalfFold method with valid true parameter, should work correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('folderStackAutoHalfFoldTrue_0100', Level.LEVEL0, async () => {
      console.info('[folderStackAutoHalfFoldTrue_0100] START');

      let strJson = getInspectorByKey('folderstack_autohalffold_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.autoHalfFold).assertEqual('true');
      console.info('[folderStackAutoHalfFoldTrue_0100] END');
    })

    /**
     * @tc.name   folderStackAutoHalfFoldFalse_0100
     * @tc.number SUB_ARKUI_FOLDERSTACK_AUTOHALFFOLD_FALSE_0100
     * @tc.desc   Test FolderStack autoHalfFold method with false parameter, should work correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('folderStackAutoHalfFoldFalse_0100', Level.LEVEL0, async () => {
      console.info('[folderStackAutoHalfFoldFalse_0100] START');

      let strJson = getInspectorByKey('folderstack_autohalffold_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.autoHalfFold).assertEqual('false');
      console.info('[folderStackAutoHalfFoldFalse_0100] END');
    })
  })
}
