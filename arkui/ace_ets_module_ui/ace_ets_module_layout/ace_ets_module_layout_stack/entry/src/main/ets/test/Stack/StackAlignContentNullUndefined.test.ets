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

export default function StackAlignContentNullUndefinedTest() {
  describe('StackAlignContentNullUndefinedTest', () => {
    beforeAll(async (done: Function) => {
      console.info("StackAlignContentNullUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Stack/StackAlignContentNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get StackAlignContentNullUndefined state pages:" + JSON.stringify(pages));
        if (!("StackAlignContentNullUndefined" == pages.name)) {
          console.info("get StackAlignContentNullUndefined pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push StackAlignContentNullUndefined page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StackAlignContentNullUndefined page error:" + err);
      }
      console.info("StackAlignContentNullUndefined beforeEach end");
      done();
    });

    /**
     * @tc.name   StackAlignContentNull_0100
     * @tc.number SUB_ARKUI_STACK_ALIGNCONTENT_NULL_0100
     * @tc.desc   Test Stack alignContent method with null parameter, should be treated as default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('StackAlignContentNull_0100', Level.LEVEL0, async () => {
      console.info('[StackAlignContentNull_0100] START');

      let strJson = getInspectorByKey('Stack_aligncontent_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.alignContent).assertEqual('Alignment.Center');
      console.info('[StackAlignContentNull_0100] END');
    })

    /**
     * @tc.name   StackAlignContentUndefined_0100
     * @tc.number SUB_ARKUI_STACK_ALIGNCONTENT_UNDEFINED_0100
     * @tc.desc   Test Stack alignContent method with undefined parameter, should be treated as default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('StackAlignContentUndefined_0100', Level.LEVEL0, async () => {
      console.info('[StackAlignContentUndefined_0100] START');

      let strJson = getInspectorByKey('Stack_aligncontent_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.alignContent).assertEqual('Alignment.Center');
      console.info('[StackAlignContentUndefined_0100] END');
    })
  })
}
