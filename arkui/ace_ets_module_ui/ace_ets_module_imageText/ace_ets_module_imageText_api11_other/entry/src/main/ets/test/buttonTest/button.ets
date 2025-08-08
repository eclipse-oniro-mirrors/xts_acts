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
import { describe, beforeEach, afterEach, it, expect } from '@ohos/hypium'
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
let emitKey = "emitUserAgent";
export default function buttonTest() {
  describe('ActsButtonTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/button/ButtonIndex",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Select state success " + JSON.stringify(pages));
        if (!("ButtonIndex" == pages.name)) {
          console.info("get Select state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push Select page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Select page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      console.info("select beforeEach start");
      done();
    })

    /**
     * @tc.number    ArkUX_Stage_Button_LabelStyle_0100
     * @tc.name      Tests the labelStyle property of the button component
     * @tc.desc      Set labelStyle Set the labelStyle parameter overflow to TextOverflow.Clip,maxLines to 1,
     *               minFontSize to 5,heightAdaptivePolicy to TextHeightAdaptivePolicy.maxLines,set the font 
     *               parameter size to 15, weight to FontWeight.Bolder,family to cursive, style to FontStyle.Italic
     */
    it('ArkUX_Stage_Button_LabelStyle_0100', 0, async (done: Function) => {
      console.info('ArkUX_FA_Button_TextOverFlow_0100 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Button_LabelStyle_0100');
          console.info('ArkUX_Stage_Button_LabelStyle_0100 START  :'+ JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_0100 component obj.$attrs.labelStyle is: " +
                       JSON.stringify(obj.$attrs.labelStyle));
          let labelStyle: ESObject = JSON.parse(obj.$attrs.labelStyle)
          console.info("ArkUX_Stage_Button_LabelStyle_0100 component obj.$attrs.labelStyle is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.overflow).assertEqual("TextOverflow.Clip");
          console.info('ArkUX_Stage_Button_LabelStyle_0100 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_0100 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    /**
     * @tc.number    ArkUX_Stage_Button_LabelStyle_0200
     * @tc.name      Tests the labelStyle property of the button component
     * @tc.desc      Set labelStyle Set the labelStyle parameter overflow to TextOverflow.Clip,maxLines to 3,
	   *               minFontSize to 5,heightAdaptivePolicy to TextHeightAdaptivePolicy.maxLines,set the font parameter
     *               size to 15,weight to FontWeight.Bolder,family to cursive, style to FontStyle.Italic
     */
    it('ArkUX_Stage_Button_LabelStyle_0200', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Button_LabelStyle_0200 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Button_LabelStyle_0200');
          console.info('ArkUX_Stage_Button_LabelStyle_0200 START  :'+ JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_0200 component obj.$attrs.fontWeight is: " +
          JSON.stringify(obj.$attrs.labelStyle));
          let labelStyle: ESObject = JSON.parse(obj.$attrs.labelStyle)
          console.info("ArkUX_Stage_Button_LabelStyle_0200 component obj.$attrs.labelStyle is: " +
          JSON.stringify(labelStyle));
          expect(labelStyle.overflow).assertEqual("TextOverflow.Clip");
          console.info('ArkUX_Stage_Button_LabelStyle_0200 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_0200 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    /**
     * @tc.number    ArkUX_Stage_Button_LabelStyle_0300
     * @tc.name      Tests the labelStyle property of the button component
     * @tc.desc      Set labelStyle Set the labelStyle parameter overflow to TextOverflow.Clip,maxLines to 3,
	   *               minFontSize to 5,heightAdaptivePolicy to TextHeightAdaptivePolicy.MinFontSize,set the font
     *               parameter size to 15, weight to FontWeight.Bolder,family to cursive, style to FontStyle.Italic
     */
    it('ArkUX_Stage_Button_LabelStyle_0300', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Button_LabelStyle_0300 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Button_LabelStyle_0300');
          console.info('ArkUX_Stage_Button_LabelStyle_0300 START  :'+ JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_0300 component obj.$attrs.textOverflow is: " +
                       JSON.stringify(obj.$attrs.labelStyle));
          let labelStyle: ESObject = JSON.parse(obj.$attrs.labelStyle)
          console.info("ArkUX_Stage_Button_LabelStyle_0300 component obj.$attrs.labelStyle is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.overflow).assertEqual("TextOverflow.Clip");
          console.info('ArkUX_Stage_Button_LabelStyle_0300 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_0300 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });
	
	  /**
     * @tc.number    ArkUX_Stage_Button_LabelStyle_0400
     * @tc.name      Tests the labelStyle property of the button component
     * @tc.desc      Set labelStyle Set the labelStyle parameter overflow to TextOverflow.Clip,maxLines to 1,
	   *               minFontSize to 5,heightAdaptivePolicy to TextHeightAdaptivePolicy.MinFontSize,set the font 
     *               parameter weight to FontWeight.Normal,family to cursive, style to FontStyle.Italic
     */
    it('ArkUX_Stage_Button_LabelStyle_0400', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Button_LabelStyle_0400 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Button_LabelStyle_0400');
          console.info('ArkUX_Stage_Button_LabelStyle_0400 START  :'+ JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_0400 component obj.$attrs.textOverflow is: " +
                       JSON.stringify(obj.$attrs.labelStyle));
          let labelStyle: ESObject = JSON.parse(obj.$attrs.labelStyle)
          console.info("ArkUX_Stage_Button_LabelStyle_0400 component obj.$attrs.labelStyle is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.overflow).assertEqual("TextOverflow.Clip");
          console.info('ArkUX_Stage_Button_LabelStyle_0400 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_0400 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });
	
	  /**
     * @tc.number    ArkUX_Stage_Button_LabelStyle_0500
     * @tc.name      Tests the labelStyle property of the button component
     * @tc.desc      Set labelStyle Set the labelStyle parameter overflow to TextOverflow.Clip,maxLines to 3,
  	 *               minFontSize to 5,heightAdaptivePolicy to TextHeightAdaptivePolicy.LayoutConstraint,set the font
     *               parameter size to 15,  weight to FontWeight.Bolder,family to cursive, style to FontStyle.Italic
     */
    it('ArkUX_Stage_Button_LabelStyle_0500', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Button_LabelStyle_0500 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Button_LabelStyle_0500');
          console.info('ArkUX_Stage_Button_LabelStyle_0500 START  :'+ JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_0500 component obj.$attrs.textOverflow is: " +
                       JSON.stringify(obj.$attrs.labelStyle));
          let labelStyle: ESObject = JSON.parse(obj.$attrs.labelStyle)
          console.info("ArkUX_Stage_Button_LabelStyle_0500 component obj.$attrs.labelStyle is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.overflow).assertEqual("TextOverflow.Clip");
          console.info('ArkUX_Stage_Button_LabelStyle_0500 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_0500 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });
	
  	/**
     * @tc.number    ArkUX_Stage_Button_LabelStyle_0600
     * @tc.name      Tests the labelStyle property of the button component
     * @tc.desc      Set labelStyle Set the labelStyle parameter overflow to TextOverflow.Ellipsis,maxLines to 1,
	   *               minFontSize to 5,heightAdaptivePolicy to TextHeightAdaptivePolicy.maxLines,set the font parameter
     *               size to 15, weight to FontWeight.Bolder,family to cursive, style to FontStyle.Italic
     */
    it('ArkUX_Stage_Button_LabelStyle_0600', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Button_LabelStyle_0600 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Button_LabelStyle_0600');
          console.info('ArkUX_Stage_Button_LabelStyle_0600 START  :'+ JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_0600 component obj.$attrs.textOverflow is: " +
                       JSON.stringify(obj.$attrs.labelStyle));
          let labelStyle: ESObject = JSON.parse(obj.$attrs.labelStyle)
          console.info("ArkUX_Stage_Button_LabelStyle_0600 component obj.$attrs.labelStyle is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.overflow).assertEqual("TextOverflow.Ellipsis");
          console.info('ArkUX_Stage_Button_LabelStyle_0600 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_0600 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });
	
  	/**
     * @tc.number    ArkUX_Stage_Button_LabelStyle_0700
     * @tc.name      Tests the labelStyle property of the button component
     * @tc.desc      Set labelStyle Set the labelStyle parameter overflow to TextOverflow.Ellipsis,maxLines to 3,
  	 *               minFontSize to 5,heightAdaptivePolicy to TextHeightAdaptivePolicy.maxLines,set the font parameter
     *               size to 15,  weight to FontWeight.Bolder,family to cursive, style to FontStyle.Italic
     */
    it('ArkUX_Stage_Button_LabelStyle_0700', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Button_LabelStyle_0700 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Button_LabelStyle_0700');
          console.info('ArkUX_Stage_Button_LabelStyle_0700 START  :'+ JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_0700 component obj.$attrs.textOverflow is: " +
                       JSON.stringify(obj.$attrs.labelStyle));
          let labelStyle: ESObject = JSON.parse(obj.$attrs.labelStyle)
          console.info("ArkUX_Stage_Button_LabelStyle_0700 component obj.$attrs.labelStyle is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.overflow).assertEqual("TextOverflow.Ellipsis");
          console.info('ArkUX_Stage_Button_LabelStyle_0700 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_0700 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });
	
  	/**
     * @tc.number    ArkUX_Stage_Button_LabelStyle_0800
     * @tc.name      Tests the labelStyle property of the button component
     * @tc.desc      Set labelStyle Set the labelStyle parameter overflow to TextOverflow.Ellipsis,maxLines to 3,
  	 *               minFontSize to 5,heightAdaptivePolicy to TextHeightAdaptivePolicy.MinFontSize,set the font 
     *               parameter size to 15, weight to FontWeight.Bolder,family to cursive, style to FontStyle.Italic
     */
    it('ArkUX_Stage_Button_LabelStyle_0800', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Button_LabelStyle_0800 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Button_LabelStyle_0800');
          console.info('ArkUX_Stage_Button_LabelStyle_0800 START  :'+ JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_0800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_0800 component obj.$attrs.textOverflow is: " +
                       JSON.stringify(obj.$attrs.labelStyle));
          let labelStyle: ESObject = JSON.parse(obj.$attrs.labelStyle)
          console.info("ArkUX_Stage_Button_LabelStyle_0800 component obj.$attrs.labelStyle is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.overflow).assertEqual("TextOverflow.Ellipsis");
          console.info('ArkUX_Stage_Button_LabelStyle_0800 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_0800 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });
	
	  /**
     * @tc.number    ArkUX_Stage_Button_LabelStyle_0900
     * @tc.name      Tests the labelStyle property of the button component
     * @tc.desc      Set labelStyle Set the labelStyle parameter overflow to TextOverflow.Ellipsis,maxLines to 1,
  	 *               minFontSize to 5,heightAdaptivePolicy to TextHeightAdaptivePolicy.MinFontSize,
  	 *               set the font parameter weight to FontWeight.Normal,family to cursive, style to FontStyle.Italic
     */
    it('ArkUX_Stage_Button_LabelStyle_0900', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Button_LabelStyle_0900 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Button_LabelStyle_0900');
          console.info('ArkUX_Stage_Button_LabelStyle_0900 START  :'+ JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_0900 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_0900 component obj.$attrs.textOverflow is: " +
                       JSON.stringify(obj.$attrs.labelStyle));
          let labelStyle: ESObject = JSON.parse(obj.$attrs.labelStyle)
          console.info("ArkUX_Stage_Button_LabelStyle_0900 component obj.$attrs.labelStyle is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.overflow).assertEqual("TextOverflow.Ellipsis");
          console.info('ArkUX_Stage_Button_LabelStyle_0900 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_0900 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });
	
	  /**
     * @tc.number    ArkUX_Stage_Button_LabelStyle_1000
     * @tc.name      Tests the labelStyle property of the button component
     * @tc.desc      Set labelStyle Set the labelStyle parameter overflow to TextOverflow.Ellipsis,maxLines to 3,
	   *               minFontSize to 5,heightAdaptivePolicy to TextHeightAdaptivePolicy.LayoutConstraint,set the font
     *         parameter size to 15,weight to FontWeight.Bolder,family to cursive, style to FontStyle.Italic
     */
    it('ArkUX_Stage_Button_LabelStyle_1000', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Button_LabelStyle_1000 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Button_LabelStyle_1000');
          console.info('ArkUX_Stage_Button_LabelStyle_1000 START  :'+ JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_1000 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_1000 component obj.$attrs.textOverflow is: " +
                       JSON.stringify(obj.$attrs.labelStyle));
          let labelStyle: ESObject = JSON.parse(obj.$attrs.labelStyle)
          console.info("ArkUX_Stage_Button_LabelStyle_1000 component obj.$attrs.labelStyle is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.overflow).assertEqual("TextOverflow.Ellipsis");
          console.info('ArkUX_Stage_Button_LabelStyle_1000 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_1000 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });
	
	  /**
     * @tc.number    ArkUX_Stage_Button_LabelStyle_1100
     * @tc.name      Tests the labelStyle property of the button component
     * @tc.desc      Set labelStyle Set the labelStyle parameter overflow to TextOverflow.None,maxLines to 1,
	   *               minFontSize to 5,heightAdaptivePolicy to TextHeightAdaptivePolicy.maxLines,set the font parameter
     *               size to 15, weight to FontWeight.Bolder,family to cursive, style to FontStyle.Italic
     */
    it('ArkUX_Stage_Button_LabelStyle_1100', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Button_LabelStyle_1100 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Button_LabelStyle_1100');
          console.info('ArkUX_Stage_Button_LabelStyle_1100 START  :'+ JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_1100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_1100 component obj.$attrs.textOverflow is: " +
                       JSON.stringify(obj.$attrs.labelStyle));
          let labelStyle: ESObject = JSON.parse(obj.$attrs.labelStyle)
          console.info("ArkUX_Stage_Button_LabelStyle_1100 component obj.$attrs.labelStyle is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.overflow).assertEqual("TextOverflow.None");
          console.info('ArkUX_Stage_Button_LabelStyle_1100 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_1100 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });
	
  	/**
     * @tc.number    ArkUX_Stage_Button_LabelStyle_1200
     * @tc.name      Tests the labelStyle property of the button component
     * @tc.desc      Set labelStyle Set the labelStyle parameter overflow to TextOverflow.None,maxLines to 3,
	   *               minFontSize to 5,heightAdaptivePolicy to TextHeightAdaptivePolicy.maxLines,set the font parameter
     *               size to 15,weight to FontWeight.Bolder,family to cursive, style to FontStyle.Italic
     */
    it('ArkUX_Stage_Button_LabelStyle_1200', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Button_LabelStyle_1200 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Button_LabelStyle_1200');
          console.info('ArkUX_Stage_Button_LabelStyle_1200 START  :'+ JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_1200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_1200 component obj.$attrs.textOverflow is: " +
                       JSON.stringify(obj.$attrs.labelStyle));
          let labelStyle: ESObject = JSON.parse(obj.$attrs.labelStyle)
          console.info("ArkUX_Stage_Button_LabelStyle_1200 component obj.$attrs.labelStyle is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.overflow).assertEqual("TextOverflow.None");
          console.info('ArkUX_Stage_Button_LabelStyle_1200 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_1200 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });
	
	  /**
     * @tc.number    ArkUX_Stage_Button_LabelStyle_1300
     * @tc.name      Tests the labelStyle property of the button component
     * @tc.desc      Set labelStyle Set the labelStyle parameter overflow to TextOverflow.None,maxLines to 3,
	   *               minFontSize to 5,heightAdaptivePolicy to TextHeightAdaptivePolicy.MinFontSize,set the font 
     *               parameter size to 15,weight to FontWeight.Bolder,family to cursive, style to FontStyle.Italic
     */
    it('ArkUX_Stage_Button_LabelStyle_1300', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Button_LabelStyle_1300 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Button_LabelStyle_1300');
          console.info('ArkUX_Stage_Button_LabelStyle_1300 START  :'+ JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_1300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_1300 component obj.$attrs.textOverflow is: " +
                       JSON.stringify(obj.$attrs.labelStyle));
          let labelStyle: ESObject = JSON.parse(obj.$attrs.labelStyle)
          console.info("ArkUX_Stage_Button_LabelStyle_1300 component obj.$attrs.labelStyle is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.overflow).assertEqual("TextOverflow.None");
          console.info('ArkUX_Stage_Button_LabelStyle_1300 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_1300 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });
	
	  /**
     * @tc.number    ArkUX_Stage_Button_LabelStyle_1400
     * @tc.name      Tests the labelStyle property of the button component
     * @tc.desc      Set labelStyle Set the labelStyle parameter overflow to TextOverflow.None,maxLines to 1,
	   *               minFontSize to 5,heightAdaptivePolicy to TextHeightAdaptivePolicy.MinFontSize,
	   *               set the font parameter weight to FontWeight.Normal,family to cursive, style to FontStyle.Italic
     */
    it('ArkUX_Stage_Button_LabelStyle_1400', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Button_LabelStyle_1400 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Button_LabelStyle_1400');
          console.info('ArkUX_Stage_Button_LabelStyle_1400 START  :'+ JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_1400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_1400 component obj.$attrs.textOverflow is: " +
                       JSON.stringify(obj.$attrs.labelStyle));
          let labelStyle: ESObject = JSON.parse(obj.$attrs.labelStyle)
          console.info("ArkUX_Stage_Button_LabelStyle_1400 component obj.$attrs.labelStyle is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.overflow).assertEqual("TextOverflow.None");
          console.info('ArkUX_Stage_Button_LabelStyle_1400 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_1400 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });
	
  	/**
     * @tc.number    ArkUX_Stage_Button_LabelStyle_1500
     * @tc.name      Tests the labelStyle property of the button component
     * @tc.desc      Set labelStyle Set the labelStyle parameter overflow to TextOverflow.None,maxLines to 3,
  	 *               minFontSize to 5,heightAdaptivePolicy to TextHeightAdaptivePolicy.LayoutConstraint,set the font
     *               parameter size to 15,weight to FontWeight.Bolder,family to cursive, style to FontStyle.Italic
     */
    it('ArkUX_Stage_Button_LabelStyle_1500', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Button_LabelStyle_1500 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Button_LabelStyle_1500');
          console.info('ArkUX_Stage_Button_LabelStyle_1500 START  :'+ JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_1500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_1500 component obj.$attrs.textOverflow is: " +
                       JSON.stringify(obj.$attrs.labelStyle));
          let labelStyle: ESObject = JSON.parse(obj.$attrs.labelStyle)
          console.info("ArkUX_Stage_Button_LabelStyle_1500 component obj.$attrs.labelStyle is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.overflow).assertEqual("TextOverflow.None");
          console.info('ArkUX_Stage_Button_LabelStyle_1500 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_1500 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });
	
	  /**
     * @tc.number    ArkUX_Stage_Button_LabelStyle_1600
     * @tc.name      Tests the labelStyle property of the button component
     * @tc.desc      Set labelStyle Set the labelStyle parameter overflow to TextOverflow.Ellipsis,maxLines to 1
     */
    it('ArkUX_Stage_Button_LabelStyle_1600', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Button_LabelStyle_1600 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Button_LabelStyle_1600');
          console.info('ArkUX_Stage_Button_LabelStyle_1600 START  :'+ JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_1600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_1600 component obj.$attrs.textOverflow is: " +
                       JSON.stringify(obj.$attrs.labelStyle));
          let labelStyle: ESObject = JSON.parse(obj.$attrs.labelStyle)
          console.info("ArkUX_Stage_Button_LabelStyle_1600 component obj.$attrs.labelStyle is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.overflow).assertEqual("TextOverflow.Ellipsis");
          console.info('ArkUX_Stage_Button_LabelStyle_1600 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_1600 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });
	
	  /**
     * @tc.number    ArkUX_Stage_Button_LabelStyle_1700
     * @tc.name      Tests the labelStyle property of the button component
     * @tc.desc      Set labelStyle Set the labelStyle parameter overflow to TextOverflow.Ellipsis,minFontSize to 5
     */
    it('ArkUX_Stage_Button_LabelStyle_1700', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Button_LabelStyle_1700 START');
      setTimeout(()=>{
        try{
          console.info('ArkUX_Stage_Button_LabelStyle_1700 START 111');
          let strJson = getInspectorByKey('ArkUX_Stage_Button_LabelStyle_1700');
          console.info('ArkUX_Stage_Button_LabelStyle_1700 START  :'+ JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_1700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_1700 component obj.$attrs.textOverflow is: " +
                       JSON.stringify(obj.$attrs.labelStyle));
          let labelStyle: ESObject = JSON.parse(obj.$attrs.labelStyle)
          console.info("ArkUX_Stage_Button_LabelStyle_1700 component obj.$attrs.labelStyle is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.overflow).assertEqual("TextOverflow.Ellipsis");
          console.info('ArkUX_Stage_Button_LabelStyle_1700 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_1700 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });
	
	  /**
     * @tc.number    ArkUX_Stage_Button_LabelStyle_1800
     * @tc.name      Tests the labelStyle property of the button component
     * @tc.desc      Set labelStyle Set the labelStyle parameter overflow to TextOverflow.Ellipsis,
  	 *               heightAdaptivePolicy to TextHeightAdaptivePolicy.maxLines
     */
    it('ArkUX_Stage_Button_LabelStyle_1800', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Button_LabelStyle_1800 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Button_LabelStyle_1800');
          console.info('ArkUX_Stage_Button_LabelStyle_1800 START  :'+ JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_1800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_1800 component obj.$attrs.textOverflow is: " +
                       JSON.stringify(obj.$attrs.labelStyle));
          let labelStyle: ESObject = JSON.parse(obj.$attrs.labelStyle)
          console.info("ArkUX_Stage_Button_LabelStyle_1800 component obj.$attrs.labelStyle is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.overflow).assertEqual("TextOverflow.Ellipsis");
          console.info('ArkUX_Stage_Button_LabelStyle_1800 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_1800 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });
	
	  /**
     * @tc.number    ArkUX_Stage_Button_LabelStyle_1900
     * @tc.name      Tests the labelStyle property of the button component
     * @tc.desc      Set labelStyle Set the labelStyle parameter overflow to TextOverflow.Ellipsis,
	   *               set the font parameter size to 15, weight to FontWeight.Bolder,family to cursive,style 
     *               to FontStyle.Italic
     */
	it('ArkUX_Stage_Button_LabelStyle_1900', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Button_LabelStyle_1900 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Button_LabelStyle_1900');
          console.info('ArkUX_Stage_Button_LabelStyle_1900 START  :'+ JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_1900 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_1900 component obj.$attrs.textOverflow is: " +
                       JSON.stringify(obj.$attrs.labelStyle));
          let labelStyle: ESObject = JSON.parse(obj.$attrs.labelStyle)
          console.info("ArkUX_Stage_Button_LabelStyle_1900 component obj.$attrs.labelStyle is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.overflow).assertEqual("TextOverflow.Ellipsis");
          console.info('ArkUX_Stage_Button_LabelStyle_1900 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_1900 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });
	
	  /**
     * @tc.number    ArkUX_Stage_Button_LabelStyle_2000
     * @tc.name      Tests the labelStyle property of the button component
     * @tc.desc      Set labelStyle Set the labelStyle parameter overflow to TextOverflow.Ellipsis
     */
    it('ArkUX_Stage_Button_LabelStyle_2000', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Button_LabelStyle_2000 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Button_LabelStyle_2000');
          console.info('ArkUX_Stage_Button_LabelStyle_2000 START  :'+ JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_2000 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_2000 component obj.$attrs.textOverflow is: " +
                       JSON.stringify(obj.$attrs.labelStyle));
          let labelStyle: ESObject = JSON.parse(obj.$attrs.labelStyle)
          console.info("ArkUX_Stage_Button_LabelStyle_2000 component obj.$attrs.labelStyle is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.overflow).assertEqual("TextOverflow.Ellipsis");
          console.info('ArkUX_Stage_Button_LabelStyle_2000 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_2000 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });
	
  	/**
     * @tc.number    ArkUX_Stage_Button_LabelStyle_2100
     * @tc.name      Tests the labelStyle property of the button component
     * @tc.desc      Set labelStyle Set the labelStyle parameter maxLines to 1,minFontSize to 5,
	   *               heightAdaptivePolicy to TextHeightAdaptivePolicy.maxLines,set the font parameter size to 15, 
	   *               weight to FontWeight.Bolder,family to cursive, style to FontStyle.Italic
     */
    it('ArkUX_Stage_Button_LabelStyle_2100', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Button_LabelStyle_2100 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Button_LabelStyle_2100');
          console.info('ArkUX_Stage_Button_LabelStyle_2100 START  :'+ JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_2100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_2100 component obj.$attrs.textOverflow is: " +
                       JSON.stringify(obj.$attrs.labelStyle));
          let labelStyle: ESObject = JSON.parse(obj.$attrs.labelStyle)
          console.info("ArkUX_Stage_Button_LabelStyle_2100 component obj.$attrs.labelStyle is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.overflow).assertEqual("TextOverflow.Ellipsis");
          console.info('ArkUX_Stage_Button_LabelStyle_2100 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_2100 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });
	
	  /**
     * @tc.number    ArkUX_Stage_Button_LabelStyle_2200
     * @tc.name      Tests the labelStyle property of the button component
     * @tc.desc      The labelStyle parameter is not set
     */
    it('ArkUX_Stage_Button_LabelStyle_2200', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Button_LabelStyle_2200 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Button_LabelStyle_2200');
          console.info('ArkUX_Stage_Button_LabelStyle_2200 START  :'+ JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_2200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_2200 component obj.$attrs.textOverflow is: " +
                       JSON.stringify(obj.$attrs.labelStyle));
          let labelStyle: ESObject = JSON.parse(obj.$attrs.labelStyle)
          console.info("ArkUX_Stage_Button_LabelStyle_2200 component obj.$attrs.labelStyle is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.overflow).assertEqual("TextOverflow.Clip");
          console.info('ArkUX_Stage_Button_LabelStyle_2200 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_2200 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });
	
	  /**
     * @tc.number    ArkUX_Stage_Button_LabelStyle_2300
     * @tc.name      Tests the labelStyle property of the button component
     * @tc.desc      Set labelStyle Set the labelStyle parameter overflow to TextOverflow.Clip,maxLines to 1,
	   *               minFontSize to 5,heightAdaptivePolicy to TextHeightAdaptivePolicy.maxLines,set the font parameter
     *               size to 15, weight to FontWeight.Bolder,family to cursive, s
     *               tyle to FontStyle.Italic(Not overlength)
     */
    it('ArkUX_Stage_Button_LabelStyle_2300', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Button_LabelStyle_2300 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Button_LabelStyle_2300');
          console.info('ArkUX_Stage_Button_LabelStyle_2300 START  :'+ JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_2300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_2300 component obj.$attrs.textOverflow is: " +
                       JSON.stringify(obj.$attrs.labelStyle));
          let labelStyle: ESObject = JSON.parse(obj.$attrs.labelStyle)
          console.info("ArkUX_Stage_Button_LabelStyle_2300 component obj.$attrs.labelStyle is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.overflow).assertEqual("TextOverflow.Clip");
          console.info('ArkUX_Stage_Button_LabelStyle_2300 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_2300 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });
	
	  /**
     * @tc.number    ArkUX_Stage_Button_LabelStyle_2400
     * @tc.name      Tests the labelStyle property of the button component
     * @tc.desc      Set labelStyle Set the labelStyle parameter overflow to TextOverflow.Ellipsis,maxLines to 1,
     *               minFontSize to 5,heightAdaptivePolicy to TextHeightAdaptivePolicy.maxLines,set the font parameter
     *               size to 15, weight to FontWeight.Bolder,family to cursive, 
     *               style to FontStyle.Italic(Not overlength)
     */
    it('ArkUX_Stage_Button_LabelStyle_2400', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Button_LabelStyle_2400 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Button_LabelStyle_2400');
          console.info('ArkUX_Stage_Button_LabelStyle_2400 START  :'+ JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_2400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_2400 component obj.$attrs.textOverflow is: " +
                       JSON.stringify(obj.$attrs.labelStyle));
          let labelStyle: ESObject = JSON.parse(obj.$attrs.labelStyle)
          console.info("ArkUX_Stage_Button_LabelStyle_2400 component obj.$attrs.labelStyle is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.overflow).assertEqual("TextOverflow.Ellipsis");
          console.info('ArkUX_Stage_Button_LabelStyle_2400 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_2400 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });
	
  	/**
     * @tc.number    ArkUX_Stage_Button_LabelStyle_2500
     * @tc.name      Tests the labelStyle property of the button component
     * @tc.desc      Set labelStyle Set the labelStyle parameter overflow to TextOverflow.None,maxLines to 1,
	   *               minFontSize to 5,heightAdaptivePolicy to TextHeightAdaptivePolicy.maxLines,set the font parameter
     *               size to 15, weight to FontWeight.Bolder,family to cursive, style to 
     *               FontStyle.Italic(Not overlength)
     */
    it('ArkUX_Stage_Button_LabelStyle_2500', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Button_LabelStyle_2500 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Button_LabelStyle_2500');
          console.info('ArkUX_Stage_Button_LabelStyle_2500 START  :'+ JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_2500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_2500 component obj.$attrs.textOverflow is: " +
                       JSON.stringify(obj.$attrs.labelStyle));
          let labelStyle: ESObject = JSON.parse(obj.$attrs.labelStyle)
          console.info("ArkUX_Stage_Button_LabelStyle_2500 component obj.$attrs.labelStyle is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.overflow).assertEqual("TextOverflow.None");
          console.info('ArkUX_Stage_Button_LabelStyle_2500 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_2500 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });
	
	  /**
     * @tc.number    ArkUX_Stage_Button_LabelStyle_2600
     * @tc.name      Tests the labelStyle property of the button component
     * @tc.desc      The labelStyle parameter is not set(Not overlength)
     */
    it('ArkUX_Stage_Button_LabelStyle_2600', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Button_LabelStyle_2600 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Button_LabelStyle_2600');
          console.info('ArkUX_Stage_Button_LabelStyle_2600 START  :'+ JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_2600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_2600 component obj.$attrs.textOverflow is: " +
                       JSON.stringify(obj.$attrs.labelStyle));
          let labelStyle: ESObject = JSON.parse(obj.$attrs.labelStyle)
          console.info("ArkUX_Stage_Button_LabelStyle_2600 component obj.$attrs.labelStyle is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.overflow).assertEqual("TextOverflow.Clip");
          console.info('ArkUX_Stage_Button_LabelStyle_2600 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_2600 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });
	
  	/**
     * @tc.number    ArkUX_Stage_Button_LabelStyle_2700
     * @tc.name      Tests the labelStyle property of the button component
     * @tc.desc      Set labelStyle Set the labelStyle parameter overflow to null,maxLines to 1,minFontSize to 5,
     *               heightAdaptivePolicy to TextHeightAdaptivePolicy.maxLines,set the font parameter size to 15, 
	   *               weight to FontWeight.Bolder,family to cursive, style to FontStyle.Italic(Not overlength)
     */
    it('ArkUX_Stage_Button_LabelStyle_2700', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Button_LabelStyle_2700 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Button_LabelStyle_2700');
          console.info('ArkUX_Stage_Button_LabelStyle_2700 START  :'+ JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_2700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_2700 component obj.$attrs.textOverflow is: " +
                       JSON.stringify(obj.$attrs.labelStyle));
          let labelStyle: ESObject = JSON.parse(obj.$attrs.labelStyle)
          console.info("ArkUX_Stage_Button_LabelStyle_2700 component obj.$attrs.labelStyle is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.overflow).assertEqual("TextOverflow.Ellipsis");
          console.info('ArkUX_Stage_Button_LabelStyle_2700 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_2700 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });
	
  	/**
     * @tc.number    ArkUX_Stage_Button_LabelStyle_2800
     * @tc.name      Tests the labelStyle property of the button component
     * @tc.desc      Set labelStyle Set the labelStyle parameter overflow to 0,maxLines to 1,minFontSize to 5,
     *               heightAdaptivePolicy to TextHeightAdaptivePolicy.maxLines,set the font parameter size to 15, 
	   *               weight to FontWeight.Bolder,family to cursive, style to FontStyle.Italic(Not overlength)
     */
    it('ArkUX_Stage_Button_LabelStyle_2800', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Button_LabelStyle_2800 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Button_LabelStyle_2800');
          console.info('ArkUX_Stage_Button_LabelStyle_2800 START  :'+ JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_2800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_2800 component obj.$attrs.textOverflow is: " +
                       JSON.stringify(obj.$attrs.labelStyle));
          let labelStyle: ESObject = JSON.parse(obj.$attrs.labelStyle)
          console.info("ArkUX_Stage_Button_LabelStyle_2800 component obj.$attrs.labelStyle is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.overflow).assertEqual("TextOverflow.None");
          console.info('ArkUX_Stage_Button_LabelStyle_2800 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_2800 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });
	
	  /**
     * @tc.number    ArkUX_Stage_Button_LabelStyle_2900
     * @tc.name      Tests the labelStyle property of the button component
     * @tc.desc      Set labelStyle Set the labelStyle parameter overflow to TextOverflow.Clip",maxLines to 1,
     *               minFontSize to 5,heightAdaptivePolicy to TextHeightAdaptivePolicy.maxLines,set the font parameter
     *               size to 15, weight to FontWeight.Bolder,family to cursive, style to FontStyle.Italic,set the 
     *               stateEffect parameter to false
     */
    it('ArkUX_Stage_Button_LabelStyle_2900', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Button_LabelStyle_2900 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Button_LabelStyle_2900');
          console.info('ArkUX_Stage_Button_LabelStyle_2900 START  :'+ JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_2900 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_2900 component obj.$attrs.textOverflow is: " +
                       JSON.stringify(obj.$attrs.labelStyle));
          let labelStyle: ESObject = JSON.parse(obj.$attrs.labelStyle)
          console.info("ArkUX_Stage_Button_LabelStyle_2900 component obj.$attrs.labelStyle is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.overflow).assertEqual("TextOverflow.Clip");
          console.info('ArkUX_Stage_Button_LabelStyle_2900 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_2900 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });
	
  	/**
     * @tc.number    ArkUX_Stage_Button_LabelStyle_3000
     * @tc.name      Tests the labelStyle property of the button component
     * @tc.desc      Set labelStyle Set the labelStyle parameter overflow to TextOverflow.Race",maxLines to 1,
	   *               minFontSize to 5,heightAdaptivePolicy to TextHeightAdaptivePolicy.maxLines,set the font parameter
     *               size to 15, weight to FontWeight.Bolder,family to cursive, style to FontStyle.Italic
     */
    it('ArkUX_Stage_Button_LabelStyle_3000', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Button_LabelStyle_3000 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Button_LabelStyle_3000');
          console.info('ArkUX_Stage_Button_LabelStyle_3000 START  :'+ JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_3000 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_3000 component obj.$attrs.textOverflow is: " +
                       JSON.stringify(obj.$attrs.labelStyle));
          let labelStyle: ESObject = JSON.parse(obj.$attrs.labelStyle)
          console.info("ArkUX_Stage_Button_LabelStyle_3000 component obj.$attrs.labelStyle is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.overflow).assertEqual("TextOverflow.Ellipsis");
          console.info('ArkUX_Stage_Button_LabelStyle_3000 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_3000 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });
  })
}
