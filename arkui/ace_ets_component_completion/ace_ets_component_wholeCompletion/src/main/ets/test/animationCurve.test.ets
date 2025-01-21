/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import Curves from '@ohos.curves'
import router from '@system.router';
export default function animationCurveTest() {

  describe('animationCurveTest', function () {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(function () {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'TestAbility/pages/animationCurve',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get animationCurve state success " + JSON.stringify(pages));
        if (!("animationCurve" == pages.name)) {
          console.info("get animationCurve state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push animationCurve page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push animationCurve page error: " + err);
      }
      done()
    });
    afterEach(function () {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(function () {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    it('ArkUX_ohos.curves_customCurve_1000', 0, async function (done) {
      console.info('ArkUX_ohos.curves_customCurve_1000 START');
      var fraction

      setTimeout(()=>{
        try{
          fraction = Curves.customCurve((fraction:number)=>{return fraction }).interpolate(0.1).toFixed(4)

          var finalRes
          if(fraction==0.1000 ){
            finalRes = true;
          }else{
            finalRes = false;
          }
          expect(finalRes).assertEqual(true);
        } catch(err) {
        }
        done();
      },500)
    });
    it('ArkUX_ohos.curves_customCurve_1100', 0, async function (done) {
      console.info('ArkUX_ohos.curves_customCurve_1000 START');

      var fraction1

      setTimeout(()=>{
        try{
          fraction1 = Curves.customCurve((fraction:number)=>{return 2*fraction }).interpolate(0.1).toFixed(4)
          console.info( "curves_customCurve_1100",fraction1)
          var finalRes1
          if(fraction1==0.2000){
            finalRes1 = true;
          }else{
            finalRes1 = false;
          }
          expect(finalRes1).assertEqual(true);
        } catch(err) {
        }
        done();
      },500)
    });
    it('ArkUX_ohos.curves_customCurve_1200', 0, async function (done) {
      console.info('ArkUX_ohos.curves_customCurve_1200 START');
      var fraction2
      setTimeout(()=>{
        try{
          fraction2 = Curves.customCurve((fraction:number)=>{return fraction*fraction }).interpolate(0.1).toFixed(4)
          console.info( "curves_customCurve_1200",fraction2)
          var finalRes2
          if(fraction2==0.0100){
            finalRes2 = true;
          }else{
            finalRes2 = false;
          }
          expect(finalRes2).assertEqual(true);
        } catch(err) {
        }
        done();
      },500)
    });
    it('ArkUX_ohos.curves_customCurve_1300', 0, async function (done) {
      console.info('ArkUX_ohos.curves_customCurve_1300 START');
      var fraction3
      var fraction4
      setTimeout(()=>{
        try{
          fraction3 = Curves.customCurve((fraction:number)=>{return fraction*fraction }).interpolate(0.1).toFixed(4)
          fraction4 = Curves.customCurve((fraction:number)=>{return fraction*fraction }).interpolate(0.1).toFixed(4)
          console.info( "curves_customCurve_1300",fraction3)
          var finalRes3
          if(fraction3==0.0100&&fraction4==0.0100){
            finalRes3 = true;
          }else{
            finalRes3 = false;
          }
          expect(finalRes3).assertEqual(true);
        } catch(err) {
        }
        done();
      },500)
    });
    it('ArkUX_ohos.curves_customCurve_1400', 0, async function (done) {
      console.info('ArkUX_ohos.curves_customCurve_1400 START');
      var fraction5
      var abc
      function interpolate3(fraction) {
       interpolate4(fraction)
        return abc
      }
      function interpolate4(fraction){
        abc=fraction
      }
      setTimeout(()=>{
        try{
        fraction5 = Curves.customCurve(interpolate3('fraction')).interpolate(0.1).toFixed(4)
          console.info('ArkUX_ohos.curves_customCurve_14005 '+ fraction5);
          var finalRes5
          if(fraction5==0.1000){
            finalRes5 = true;

          }else{
            finalRes5 = false;
          }
          expect(finalRes5).assertEqual(true);
        } catch(err) {
        }
        done();
      },1000)
    });

  })
}