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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function swipeActionNullUndefinedTest() {
  describe('swipeActionNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("swipeActionNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/arcListItemDefault/swipeActionNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get   state pages:" + JSON.stringify(pages));
        if (!("swipeActionNullUndefinedTest" == pages.name)) {
          console.info("get swipeActionNullUndefinedTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push swipeActionNullUndefinedTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push swipeActionNullUndefinedTest page error:" + err);
      }
      console.info("swipeActionNullUndefinedTest beforeEach end");
      done();
    });

    /**
     * @tc.name   arcListItemSwipeActionNullUndefined_0100
     * @tc.number SUB_ARKUI_ARCLISTITEM_SWIPEACTION_NULL_0100
     * @tc.desc   Test ArcListItem swipeAction property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcListItemSwipeActionNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[arcListItemSwipeActionNullUndefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('arclistitem_swipeAction_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('arclistitem_swipeAction_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[arcListItemSwipeActionNullUndefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs.swipeAction));
      console.info("[arcListItemSwipeActionNullUndefined_0100] null obj is: " + JSON.stringify(obj.$attrs.swipeAction));

      // null 应该恢复为默认值 (swipeAction 在默认情况下可能不存在于 attrs 中)
      let hasDefaultAction = objCompare.$attrs.swipeAction !== undefined && objCompare.$attrs.swipeAction !== null;
      let hasNullAction = obj.$attrs.swipeAction !== undefined && obj.$attrs.swipeAction !== null;

      // 如果默认没有 swipeAction，null 后也应该没有
      if (!hasDefaultAction) {
        expect(hasNullAction).assertFalse();
      } else {
        expect(obj.$attrs.swipeAction).assertEqual(objCompare.$attrs.swipeAction);
      }
      console.info('[arcListItemSwipeActionNullUndefined_0100] END');
    })

    /**
     * @tc.name   arcListItemSwipeActionNullUndefined_0200
     * @tc.number SUB_ARKUI_ARCLISTITEM_SWIPEACTION_NULL_0200
     * @tc.desc   Test ArcListItem swipeAction property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcListItemSwipeActionNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[arcListItemSwipeActionNullUndefined_0200] START');

      let strJsonCompare: string = getInspectorByKey('arclistitem_swipeAction_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('arclistitem_swipeAction_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[arcListItemSwipeActionNullUndefined_0200] default obj is: " + JSON.stringify(objCompare.$attrs.swipeAction));
      console.info("[arcListItemSwipeActionNullUndefined_0200] undefined obj is: " + JSON.stringify(obj.$attrs.swipeAction));

      // undefined 应该恢复为默认值
      let hasDefaultAction = objCompare.$attrs.swipeAction !== undefined && objCompare.$attrs.swipeAction !== null;
      let hasUndefinedAction = obj.$attrs.swipeAction !== undefined && obj.$attrs.swipeAction !== null;

      // 如果默认没有 swipeAction，undefined 后也应该没有
      if (!hasDefaultAction) {
        expect(hasUndefinedAction).assertFalse();
      } else {
        expect(obj.$attrs.swipeAction).assertEqual(objCompare.$attrs.swipeAction);
      }
      console.info('[arcListItemSwipeActionNullUndefined_0200] END');
    })
  })
}
