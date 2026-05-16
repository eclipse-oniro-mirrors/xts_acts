/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import CommonFunc from '../../MainAbility/common/Common';

export default function UseSizeTypeNullUndefinedTest() {
  describe('UseSizeTypeNullUndefinedTest', () => {
    beforeAll(async (done: Function) => {
      console.info("UseSizeTypeNullUndefined beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonAttrs/UseSizeTypeNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get UseSizeTypeNullUndefined state success " + JSON.stringify(pages));
        if (!("UseSizeTypeNullUndefined" == pages.name)) {
          console.info("get UseSizeTypeNullUndefined state success " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push UseSizeTypeNullUndefined page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push UseSizeTypeNullUndefined page error: " + err);
      }
      done()
    });

    /**
     * @tc.name   UseSizeTypeNullUndefinedTest_0100
     * @tc.number UseSizeTypeNullUndefinedTest_0100
     * @tc.desc   test useSizeType with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UseSizeTypeNullUndefinedTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('UseSizeTypeNullUndefinedTest_0100 START');

      let strJson = getInspectorByKey('UseSizeTypeNullUndefinedTest_2');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[UseSizeTypeNullUndefinedTest_0100] obj.$attrs.useSizeType:' + JSON.stringify(obj.$attrs.useSizeType));
      expect(obj.$attrs.useSizeType.default.span).assertEqual(1);
      expect(obj.$attrs.useSizeType.default.offset).assertEqual(0);
      console.info('UseSizeTypeNullUndefinedTest_0100 END');
      done();
    });

    /**
     * @tc.name   UseSizeTypeNullUndefinedTest_0200
     * @tc.number UseSizeTypeNullUndefinedTest_0200
     * @tc.desc   test useSizeType with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UseSizeTypeNullUndefinedTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('UseSizeTypeNullUndefinedTest_0200 START');

      let strJson = getInspectorByKey('UseSizeTypeNullUndefinedTest_3');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[UseSizeTypeNullUndefinedTest_0200] obj.$attrs.useSizeType:' + JSON.stringify(obj.$attrs.useSizeType));
      expect(obj.$attrs.useSizeType.default.span).assertEqual(1);
      expect(obj.$attrs.useSizeType.default.offset).assertEqual(0);
      console.info('UseSizeTypeNullUndefinedTest_0200 END');
      done();
    });
  })
}

