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

export default function frictionNullUndefinedTest() {
  describe('frictionNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("frictionNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/arcListDefault/frictionNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get   state pages:" + JSON.stringify(pages));
        if (!("frictionNullUndefinedTest" == pages.name)) {
          console.info("get frictionNullUndefinedTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push frictionNullUndefinedTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push frictionNullUndefinedTest page error:" + err);
      }
      console.info("frictionNullUndefinedTest beforeEach end");
      done();
    });

    /**
     * @tc.name   arcListFrictionNullUndefined_0100
     * @tc.number SUB_ARKUI_ARCLIST_FRICTION_NULL_0100
     * @tc.desc   Test ArcList friction property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcListFrictionNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[arcListFrictionNullUndefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('arclist_friction_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('arclist_friction_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[arcListFrictionNullUndefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs.friction));
      console.info("[arcListFrictionNullUndefined_0100] null obj is: " + JSON.stringify(obj.$attrs.friction));

      // null 应该恢复为默认值
      expect(obj.$attrs.friction).assertEqual(objCompare.$attrs.friction);
      console.info('[arcListFrictionNullUndefined_0100] END');
    })

    /**
     * @tc.name   arcListFrictionNullUndefined_0200
     * @tc.number SUB_ARKUI_ARCLIST_FRICTION_NULL_0200
     * @tc.desc   Test ArcList friction property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcListFrictionNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[arcListFrictionNullUndefined_0200] START');

      let strJsonCompare: string = getInspectorByKey('arclist_friction_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('arclist_friction_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[arcListFrictionNullUndefined_0200] default obj is: " + JSON.stringify(objCompare.$attrs.friction));
      console.info("[arcListFrictionNullUndefined_0200] undefined obj is: " + JSON.stringify(obj.$attrs.friction));

      // undefined 应该恢复为默认值
      expect(obj.$attrs.friction).assertEqual(objCompare.$attrs.friction);
      console.info('[arcListFrictionNullUndefined_0200] END');
    })
  })
}
