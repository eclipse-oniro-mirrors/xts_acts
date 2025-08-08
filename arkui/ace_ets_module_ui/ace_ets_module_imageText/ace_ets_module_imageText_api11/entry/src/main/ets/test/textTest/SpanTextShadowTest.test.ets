/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import { Driver } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function SpanTextShadowTest() {
  describe('SpanTextShadowTest', () => {
    beforeEach(async (done: Function) => {
      console.info("SpanTextShadowTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/text/SpanTextShadowTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SpanTextShadowTest state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        if (!("SpanTextShadowTest" == pages.name)) {
          console.info("get SpanTextShadowTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push SpanTextShadowTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SpanTextShadowTest page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SpanTextShadowTest after each called");
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0001
    * @tc.name         SpanTextShadowTest0001
    * @tc.desic        test ShadowOptions {radius:1,type:ShadowType.COLOR,color:Color.Blue,offsetX:10,offsetY:10,fill:true}
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        1
     */
    it('SpanTextShadowTest0001', Level.LEVEL1, async (done: Function) => {
      console.info('SpanTextShadowTest0001 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('spanTextShadow1');
      let obj: ESObject = JSON.parse(strJson);
      console.log('spanTextShadow1-----' +JSON.stringify(obj.$attrs.textShadow));
      expect(obj.$attrs.textShadow.radius).assertEqual('1.000000');
      expect(obj.$attrs.textShadow.color).assertEqual('#FF0000FF');
      expect(obj.$attrs.textShadow.offsetX).assertEqual('10.000000');
      expect(obj.$attrs.textShadow.offsetY).assertEqual('10.000000');
      expect(obj.$attrs.textShadow.type).assertEqual('0');
      console.info("[SpanTextShadowTest0001] end");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0002
    * @tc.name         SpanTextShadowTest0002
    * @tc.desic        test ShadowOptions {radius:-1,type:ShadowType.BLUR,color:Color.Green,offsetX:-10,offsetY:-10,fill:false}
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        1
     */
    it('SpanTextShadowTest0002', Level.LEVEL1, async (done: Function) => {
      console.info('SpanTextShadowTest0002 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('spanTextShadow2');
      let obj: ESObject = JSON.parse(strJson);
      console.log('spanTextShadow2-----' +JSON.stringify(obj.$attrs.textShadow));
      expect(obj.$attrs.textShadow.radius).assertEqual('0.000000');
      expect(obj.$attrs.textShadow.color).assertEqual('#FF008000');
      expect(obj.$attrs.textShadow.offsetX).assertEqual('-10.000000');
      expect(obj.$attrs.textShadow.offsetY).assertEqual('-10.000000');
      expect(obj.$attrs.textShadow.type).assertEqual('1');
      console.info("[SpanTextShadowTest0002] end");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0003
    * @tc.name         SpanTextShadowTest0003
    * @tc.desic        test ShadowOptions []
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        1
     */
    it('SpanTextShadowTest0003', Level.LEVEL1, async (done: Function) => {
      console.info('SpanTextShadowTest0003 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('spanTextShadow3');
      let obj: ESObject = JSON.parse(strJson);
      console.log('spanTextShadow3-----' +JSON.stringify(obj.$attrs.textShadow));
      let item1:ESObject = obj.$attrs.textShadow[0]
      let item2:ESObject = obj.$attrs.textShadow[1]
      expect(item1.radius).assertEqual('1.000000');
      expect(item1.color).assertEqual('#FF0000FF');
      expect(item1.offsetX).assertEqual('10.000000');
      expect(item1.offsetY).assertEqual('10.000000');
      expect(item1.type).assertEqual('0');
      expect(item2.radius).assertEqual('0.000000');
      expect(item2.color).assertEqual('#FF008000');
      expect(item2.offsetX).assertEqual('-10.000000');
      expect(item2.offsetY).assertEqual('-10.000000');
      expect(item2.type).assertEqual('1');
      console.info("[SpanTextShadowTest0003] end");
      done();
    });
  })
}