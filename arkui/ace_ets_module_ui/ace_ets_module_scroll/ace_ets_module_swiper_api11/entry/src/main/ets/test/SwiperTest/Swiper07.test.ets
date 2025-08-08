/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';

export default function Swiper07Test() {
  describe('Swiper07Test',  () =>{
    beforeEach(async (done: Function) =>{
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Swiper/Swiper07',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get swiper state success " + JSON.stringify(pages));
        if (!("Swiper07" == pages.name)) {
          console.info("get swiper state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push swiper page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push swiper page error: " + err);
      }
      done()
    });
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll( () => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })

    it('ArkUX_Grid_List_Swiper_0300', Level.LEVEL1, async (done: Function) =>{
      console.info('ArkUX_Grid_List_Swiper_0300 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Grid_List_Swiper_0300');
          console.info('ArkUX_Grid_List_Swiper_0300 START  :'+ JSON.stringify(strJson));
          
          console.info("ArkUX_Grid_List_Swiper_0300 JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          
          expect(JSON.parse(strJson).$attrs.minSize).assertEqual("200.00vp");
          console.info('ArkUX_Grid_List_Swiper_0300 END ');

        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Grid_List_Swiper_0300 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Grid_List_Swiper_0310', Level.LEVEL1, async (done: Function) =>{
      console.info('ArkUX_Grid_List_Swiper_0310 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Grid_List_Swiper_0310');
          console.info('ArkUX_Grid_List_Swiper_0310 START  :'+ JSON.stringify(strJson));
          
          console.info("ArkUX_Grid_List_Swiper_0310 JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          
          expect(JSON.parse(strJson).$attrs.minSize).assertEqual("100.00vp");
          console.info('ArkUX_Grid_List_Swiper_0310 END ');

        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Grid_List_Swiper_0310 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Grid_List_Swiper_0320', Level.LEVEL1, async (done: Function) =>{
      console.info('ArkUX_Grid_List_Swiper_0320 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Grid_List_Swiper_0320');
          console.info('ArkUX_Grid_List_Swiper_0320 START  :'+ JSON.stringify(strJson));
          console.info("ArkUX_Grid_List_Swiper_0320 JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          expect(JSON.parse(strJson).$attrs.minSize).assertEqual("0.00vp");
          console.info('ArkUX_Grid_List_Swiper_0320 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Grid_List_Swiper_0320 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Grid_List_Swiper_0330', Level.LEVEL1, async (done: Function) =>{
      console.info('ArkUX_Grid_List_Swiper_0330 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Grid_List_Swiper_0330');
          console.info('ArkUX_Grid_List_Swiper_0330 START  :'+ JSON.stringify(strJson));
          console.info("ArkUX_Grid_List_Swiper_0330 JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          expect(JSON.parse(strJson).$attrs.minSize).assertEqual("500.00vp");
          console.info('ArkUX_Grid_List_Swiper_0330 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Grid_List_Swiper_0330 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Grid_List_Swiper_0340', Level.LEVEL1, async (done: Function) =>{
      console.info('ArkUX_Grid_List_Swiper_0340 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Grid_List_Swiper_0340');
          console.info('ArkUX_Grid_List_Swiper_0340 START  :'+ JSON.stringify(strJson));
          console.info("ArkUX_Grid_List_Swiper_0340 JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          expect(JSON.parse(strJson).$attrs.minSize).assertEqual("0.00vp");
          console.info('ArkUX_Grid_List_Swiper_0340 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Grid_List_Swiper_0340 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

  })
}