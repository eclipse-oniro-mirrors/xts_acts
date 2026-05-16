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

export default function ChainModeNullUndefinedTest() {
  describe('ChainModeNullUndefinedTest', () => {
    beforeAll(async (done: Function) => {
      console.info("ChainModeNullUndefined beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonAttrs/ChainModeNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ChainModeNullUndefined state success " + JSON.stringify(pages));
        if (!("ChainModeNullUndefined" == pages.name)) {
          console.info("get ChainModeNullUndefined state success " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ChainModeNullUndefined page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ChainModeNullUndefined page error: " + err);
      }
      done()
    });

    /**
     * @tc.name   ChainModeNullUndefinedTest_0100
     * @tc.number ChainModeNullUndefinedTest_0100
     * @tc.desc   test chainMode with null/undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ChainModeNullUndefinedTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('ChainModeNullUndefinedTest_0100 START');

      let strJson = getInspectorByKey('ChainModeNullUndefinedTest_row4');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let strJson2 = getInspectorByKey('ChainModeNullUndefinedTest_row7');
      let obj2: Record<string, ESObject> = JSON.parse(strJson2);
      console.info('[ChainModeNullUndefinedTest_0100] obj.$attrs.chainMode:' + obj.$attrs.chainMode);
      console.info('[ChainModeNullUndefinedTest_0100] obj2.$attrs.chainMode:' + obj2.$attrs.chainMode);
      expect(obj.$attrs.chainMode).assertEqual(obj2.$attrs.chainMode);
      console.info('ChainModeNullUndefinedTest_0100 END');
      done();
    });
  })
}

