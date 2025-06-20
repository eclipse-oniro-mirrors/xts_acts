/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Utils from '../../MainAbility/common/Utils'

export default function hoverEffectJsunit() {
  describe('hoverEffectTest', () => {
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/imageEffects/hoverEffect',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get hoverEffect state success " + JSON.stringify(pages));
        if (!("hoverEffect" == pages.name)) {
          console.info("get hoverEffect state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push hoverEffect page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push hoverEffect page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("hoverEffect after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testhoverEffect0001
     * @tc.desic         acehoverEffectEtsTest0001
     */
    it('testhoverEffect0001', Level.LEVEL2, async (done: Function) => {
      console.info('hoverEffect testhoverEffect0001 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('ScaleText');
      console.info("[testhoverEffect0001] component hoverEffect strJson:" + strJson);
      expect(JSON.parse(strJson).$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.hoverEffect).assertEqual('HoverEffect.Scale');
      console.info("[testhoverEffect0001] hoverEffect value :" + JSON.parse(strJson).$attrs.hoverEffect);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testhoverEffect0002
     * @tc.desic         acehoverEffectEtsTest0002
     */
    it('testhoverEffect0002', Level.LEVEL2, async (done: Function) => {
      console.info('hoverEffect testhoverEffect0002 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('HighlightText');
      console.info("[testhoverEffect0002] component hoverEffect strJson:" + strJson);
      expect(JSON.parse(strJson).$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.hoverEffect).assertEqual('HoverEffect.Highlight');
      console.info("[testhoverEffect0002] hoverEffect value :" + JSON.parse(strJson).$attrs.hoverEffect);
      done();
    });
  })
}