/*
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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function sliderTrackThicknessTest() {

  describe('SliderTrackThicknessTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testSliderTrackThickness001
     * @tc.number SUB_ARKUI_CAPI_SLIDER_TRACKTHICKNESS_0100
     * @tc.desc   testing thickness of track for slider with SliderStyle.OutSet and normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSliderTrackThickness001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderTrackThickness001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSliderTrackThickness002
     * @tc.number SUB_ARKUI_CAPI_SLIDER_TRACKTHICKNESS_0200
     * @tc.desc   testing thickness of track for slider with SliderStyle.OutSet and abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSliderTrackThickness002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderTrackThickness002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSliderTrackThickness003
     * @tc.number SUB_ARKUI_CAPI_SLIDER_TRACKTHICKNESS_0300
     * @tc.desc   testing thickness of track for slider with SliderStyle.OutSet and abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSliderTrackThickness003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderTrackThickness003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSliderTrackThickness004
     * @tc.number SUB_ARKUI_CAPI_SLIDER_TRACKTHICKNESS_0400
     * @tc.desc   testing thickness of track for slider with SliderStyle.OutSet and NULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSliderTrackThickness004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderTrackThickness004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSliderTrackThickness005
     * @tc.number SUB_ARKUI_CAPI_SLIDER_TRACKTHICKNESS_0500
     * @tc.desc   testing thickness of track for slider with SliderStyle.OutSet and default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSliderTrackThickness005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderTrackThickness005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSliderTrackThickness006
     * @tc.number SUB_ARKUI_CAPI_SLIDER_TRACKTHICKNESS_0600
     * @tc.desc   testing thickness of track for slider with SliderStyle.OutSet and normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSliderTrackThickness006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderTrackThickness006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSliderTrackThickness007
     * @tc.number SUB_ARKUI_CAPI_SLIDER_TRACKTHICKNESS_0700
     * @tc.desc   testing thickness of track for slider with SliderStyle.OutSet and abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSliderTrackThickness007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderTrackThickness007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSliderTrackThickness008
     * @tc.number SUB_ARKUI_CAPI_SLIDER_TRACKTHICKNESS_0800
     * @tc.desc   testing thickness of track for slider with SliderStyle.OutSet and abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSliderTrackThickness008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderTrackThickness008()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSliderTrackThickness009
     * @tc.number SUB_ARKUI_CAPI_SLIDER_TRACKTHICKNESS_0900
     * @tc.desc   testing thickness of track for slider with SliderStyle.OutSet and NULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSliderTrackThickness009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderTrackThickness009()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSliderTrackThickness010
     * @tc.number SUB_ARKUI_CAPI_SLIDER_TRACKTHICKNESS_1000
     * @tc.desc   testing thickness of track for slider with SliderStyle.OutSet and default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSliderTrackThickness010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderTrackThickness010()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSliderTrackThickness011
     * @tc.number SUB_ARKUI_CAPI_SLIDER_TRACKTHICKNESS_1100
     * @tc.desc   testing thickness of track for slider with SliderStyle.OutSet and normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSliderTrackThickness011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderTrackThickness011()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSliderTrackThickness012
     * @tc.number SUB_ARKUI_CAPI_SLIDER_TRACKTHICKNESS_1200
     * @tc.desc   testing thickness of track for slider with SliderStyle.OutSet and abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSliderTrackThickness012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderTrackThickness012()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSliderTrackThickness013
     * @tc.number SUB_ARKUI_CAPI_SLIDER_TRACKTHICKNESS_1300
     * @tc.desc   testing thickness of track for slider with SliderStyle.OutSet and abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSliderTrackThickness013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderTrackThickness013()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSliderTrackThickness014
     * @tc.number SUB_ARKUI_CAPI_SLIDER_TRACKTHICKNESS_1400
     * @tc.desc   testing thickness of track for slider with SliderStyle.OutSet and NULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSliderTrackThickness014', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderTrackThickness014()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSliderTrackThickness015
     * @tc.number SUB_ARKUI_CAPI_SLIDER_TRACKTHICKNESS_1500
     * @tc.desc   testing thickness of track for slider with SliderStyle.OutSet and default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSliderTrackThickness015', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSliderTrackThickness015()).assertEqual(0)
      done()
    })
  })
}
