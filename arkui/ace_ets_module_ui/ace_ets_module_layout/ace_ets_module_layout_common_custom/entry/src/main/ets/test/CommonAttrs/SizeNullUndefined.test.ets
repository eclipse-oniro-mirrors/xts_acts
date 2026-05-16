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

export default function SizeNullUndefinedTest() {
  describe('SizeNullUndefinedTest', () => {
    beforeAll(async (done: Function) => {
      console.info("SizeNullUndefined beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonAttrs/SizeNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SizeNullUndefined state success " + JSON.stringify(pages));
        if (!("SizeNullUndefined" == pages.name)) {
          console.info("get SizeNullUndefined state success " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SizeNullUndefined page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SizeNullUndefined page error: " + err);
      }
      done()
    });

    /**
     * @tc.name   SizeNullUndefinedTest_0100
     * @tc.number SizeNullUndefinedTest_0100
     * @tc.desc   test size with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SizeNullUndefinedTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('SizeNullUndefinedTest_0100 START');

      let strJson = getInspectorByKey('SizeNullUndefinedTest_2');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[SizeNullUndefinedTest_0100] obj.$attrs.size.width:' + obj.$attrs.size.width);
      console.info('[SizeNullUndefinedTest_0100] obj.$attrs.size.height:' + obj.$attrs.size.height);
      expect(obj.$attrs.size.width).assertEqual("0.00vp");
      expect(obj.$attrs.size.height).assertEqual("0.00vp");
      console.info('SizeNullUndefinedTest_0100 END');
      done();
    });

    /**
     * @tc.name   SizeNullUndefinedTest_0200
     * @tc.number SizeNullUndefinedTest_0200
     * @tc.desc   test size with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SizeNullUndefinedTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('SizeNullUndefinedTest_0200 START');

      let strJson = getInspectorByKey('SizeNullUndefinedTest_3');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[SizeNullUndefinedTest_0200] obj.$attrs.size.width:' + obj.$attrs.size.width);
      console.info('[SizeNullUndefinedTest_0200] obj.$attrs.size.height:' + obj.$attrs.size.height);
      expect(obj.$attrs.size.width).assertEqual("0.00vp");
      expect(obj.$attrs.size.height).assertEqual("0.00vp");
      console.info('SizeNullUndefinedTest_0200 END');
      done();
    });
  })
}

