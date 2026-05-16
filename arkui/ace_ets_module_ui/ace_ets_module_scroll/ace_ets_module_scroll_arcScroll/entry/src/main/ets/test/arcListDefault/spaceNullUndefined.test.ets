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

export default function spaceNullUndefinedTest() {
  describe('spaceNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("spaceNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/arcListDefault/spaceNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get   state pages:" + JSON.stringify(pages));
        if (!("spaceNullUndefined" == pages.name)) {
          console.info("get spaceNullUndefinedTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push spaceNullUndefinedTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push spaceNullUndefinedTest page error:" + err);
      }
      console.info("spaceNullUndefinedTest beforeEach end");
      done();
    });

    /**
     * @tc.name   arcListSpaceNullUndefined_0100
     * @tc.number arcListSpaceNullUndefined_0100
     * @tc.desc   Test ArcList space property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcListSpaceNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[arcListSpaceNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('arclist_space_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[arcListSpaceNullUndefined_0100] default obj is: " + JSON.stringify(obj.$attrs.space));

      // ArcList space 不设置
      expect(obj.$attrs.space).assertEqual("0.00vp");
      console.info('[arcListSpaceNullUndefined_0100] END');
    })

    /**
     * @tc.name   arcListSpaceNullUndefined_0200
     * @tc.number arcListSpaceNullUndefined_0200
     * @tc.desc   Test ArcList space property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcListSpaceNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[arcListSpaceNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('arclist_space_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[arcListSpaceNullUndefined_0200] null obj is: " + JSON.stringify(obj.$attrs.space));

      // ArcList space 设置null
      let spaceNum :number = Number(obj.$attrs.space.split('.')[0])
      expect(spaceNum).assertEqual(0);
      console.info('[arcListSpaceNullUndefined_0200] END');
    })

    /**
     * @tc.name   arcListSpaceNullUndefined_0300
     * @tc.number arcListSpaceNullUndefined_0300
     * @tc.desc   Test ArcList space property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcListSpaceNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[arcListSpaceNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('arclist_space_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[arcListSpaceNullUndefined_0300] undefined obj is: " + JSON.stringify(obj.$attrs.space));

      // ArcList space 设置undefined
      let spaceNum :number = Number(obj.$attrs.space.split('.')[0])
      expect(spaceNum).assertEqual(0);
      console.info('[arcListSpaceNullUndefined_0300] END');
    })
  })
}