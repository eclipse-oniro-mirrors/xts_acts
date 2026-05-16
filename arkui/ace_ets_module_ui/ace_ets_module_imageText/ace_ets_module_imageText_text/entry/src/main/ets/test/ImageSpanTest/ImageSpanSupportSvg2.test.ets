/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import router from '@ohos.router';
import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium'
import { Component, Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function ImageSpanSupportSvg2() {
  describe('ImageSpanSupportSvg2', () => {
    beforeEach(async (done: Function) => {
      console.info('ImageSpanSupportSvg2 beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageSpan/ImageSpanSupportSvg2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ImageSpanSupportSvg2 state success ' + JSON.stringify(pages));
        if (!('ImageSupportSvg2' == pages.name)) {
          console.info('get ImageSpanSupportSvg2 state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await CommonFunc.sleep(2000);
          console.info('push ImageSpanSupportSvg2 page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push ImageSpanSupportSvg2 page error ' + JSON.stringify(err));
      }
      console.info('ImageSpanSupportSvg2 beforeEach start');
      done();
    })

    /**
     * @tc.name   ImageSpanSupportSvg2Test001
     * @tc.number ImageSpanSupportSvg2Test001
     * @tc.desc   To test the supportSvg2 true
     * @tc.level: 0
     * @tc.type:  Function
     * @tc.size:  MEDIUMTEST
     */
    it('ImageSpanSupportSvg2Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('ImageSpanSupportSvg2Test001 START');
      let strJson = getInspectorByKey('SupportSvg2_imageSpan1');
      let obj: ESObject = JSON.parse(strJson);
      console.info('ImageSpanSupportSvg2Test001 component obj supportSvg2 is: ' + obj.$attrs.supportSvg2);
      expect(obj.$attrs.supportSvg2).assertEqual('true');
      done();
    });

    /**
     * @tc.name     ImageSpanSupportSvg2Test002
     * @tc.number   ImageSpanSupportSvg2Test002
     * @tc.desc     To test the supportSvg2 false
     * @tc.level:   0
     * @tc.type:    Function
     * @tc.size:    MEDIUMTEST
     */
    it('ImageSpanSupportSvg2Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('ImageSpanSupportSvg2Test002 START');
      let strJson = getInspectorByKey('SupportSvg2_imageSpan2');
      let obj: ESObject = JSON.parse(strJson);
      console.info('ImageSpanSupportSvg2Test002 component obj supportSvg2 is: ' + obj.$attrs.supportSvg2);
      expect(obj.$attrs.supportSvg2).assertEqual('false');
      done();
    });

    /**
     * @tc.name     ImageSpanSupportSvg2Test003
     * @tc.number   ImageSpanSupportSvg2Test003
     * @tc.desc     To test the supportSvg2 null
     * @tc.level:   0
     * @tc.type:    Function
     * @tc.size:    MEDIUMTEST
     */
    it('ImageSpanSupportSvg2Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('ImageSpanSupportSvg2Test003 START');
      let strJson = getInspectorByKey('SupportSvg2_imageSpan3');
      let obj: ESObject = JSON.parse(strJson);
      console.info('ImageSpanSupportSvg2Test003 component obj supportSvg2 is: ' + obj.$attrs.supportSvg2);
      expect(obj.$attrs.supportSvg2).assertEqual('false');
      done();
    });

    /**
     * @tc.name     ImageSpanSupportSvg2Test004
     * @tc.number   ImageSpanSupportSvg2Test004
     * @tc.desc     To test the supportSvg2 undefined
     * @tc.level:   0
     * @tc.type:    Function
     * @tc.size:    MEDIUMTEST
     */
    it('ImageSpanSupportSvg2Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('ImageSpanSupportSvg2Test004 START');
      let strJson = getInspectorByKey('SupportSvg2_imageSpan4');
      let obj: ESObject = JSON.parse(strJson);
      console.info('ImageSpanSupportSvg2Test004 component obj supportSvg2 is: ' + obj.$attrs.supportSvg2);
      expect(obj.$attrs.supportSvg2).assertEqual('false');
      done();
    });

    /**
     * @tc.name     ImageSpanSupportSvg2Test005
     * @tc.number   ImageSpanSupportSvg2Test005
     * @tc.desc     To test the supportSvg2 default
     * @tc.level:   0
     * @tc.type:    Function
     * @tc.size:    MEDIUMTEST
     */
    it('ImageSpanSupportSvg2Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('ImageSpanSupportSvg2Test005 START');
      let strJson = getInspectorByKey('SupportSvg2_imageSpan5');
      let obj: ESObject = JSON.parse(strJson);
      console.info('ImageSpanSupportSvg2Test005 component obj supportSvg2 is: ' + obj.$attrs.supportSvg2);
      expect(obj.$attrs.supportSvg2).assertEqual('false');
      done();
    });
  })
}