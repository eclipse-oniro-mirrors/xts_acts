/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

import {describe,beforeAll,beforeEach,afterEach,afterAll,it,expect, Level}from '@ohos/hypium'
import mediaquery from '@system.mediaquery';

export default function mediaquery_vioTest() {
describe('mediaquery_vioTest', function() {
    let testResult;
    let test;
    beforeAll(function() {
        testResult = false;
        test="success"
    });

    /**
     * @tc.name   addListener
     * @tc.number addListener
     * @tc.desc   addListener
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('addListener', Level.LEVEL0, function() {
        console.info('MediaQuery addListener start');
        var mMediaQueryList = mediaquery.matchMedia('(min-height:0)');
//        mMediaQueryList.onreadystatechange = function(){
            function minWidthMatch(e){
                if(e.matches){
                    //do something
                    expect(e.matches).assertEqual(true);
                    console.info('MediaQuery addListener success');
                    expect(test).assertEqual('success');
                }
                else{
                    expect(e.matches).assertEqual(true);
                    console.info('MediaQuery addListener fail');
                    expect(test).assertEqual('fail');
                }
            }

            mMediaQueryList.addListener(minWidthMatch)
            console.info('MediaQuery addListener end');
       // }
    });

    /**
     * @tc.name   matchMedia
     * @tc.number matchMedia
     * @tc.desc   matchMedia
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('matchMedia', Level.LEVEL0, function() {
        console.info('matchMedia start');
        var mMediaQueryList = mediaquery.matchMedia('(min-height:0)');
        var med = mMediaQueryList.media
        console.info("media:"+med)
        mMediaQueryList.onchange = function(){
            console.info('MediaQuery detonate onchange')
        }
        function minWidthMatch(e){
            if(e.matches){
                console.info("MediaQuery matches:"+e.matches)
                console.info("MediaQuery onchangeMessage:"+e.onchange)
                console.info('MediaQuery matchMedia success');
                expect(test).assertEqual('success');
            }
            else{
                console.info('MediaQuery matchMedia fail');
                expect(test).assertEqual('fail');
            }
            console.info('MediaQuery matchMedia end');
        }
        mMediaQueryList.addListener(minWidthMatch);
    });

    /**
     * @tc.name   orientation
     * @tc.number orientation
     * @tc.desc   orientation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('orientation', Level.LEVEL0, function() {
        console.info('orientation test start');
        var mMediaQueryList = mediaquery.matchMedia('(orientation:landscape)');
        var med = mMediaQueryList.media
        console.info("orientation onchangeMessage:"+mMediaQueryList.onchange)
        function orientationMatch(e){
            if(e.matches){
                //do something
                console.info("MediaQuery orientation matches:"+e.matches)
                console.info('MediaQuery orientation success');
                expect(test).assertEqual('success');
            }
            else{
                console.info('MediaQuery orientation fail');
                expect(test).assertEqual('fail');
            }
        }
        mMediaQueryList.addListener(orientationMatch)
        console.info('MediaQuery orientation test end')
    });

    /**
     * @tc.name   rmeoveListener
     * @tc.number rmeoveListener
     * @tc.desc   rmeoveListener
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('rmeoveListener', Level.LEVEL0, function() {
        console.info('rmeoveListener start');
        var mMediaQueryList = mediaquery.matchMedia('(max-width:466)');
        function maxWidthMatch(e){
            if(e.matches){
                //do something
                console.info('MediaQuery rmeoveListener success');
                expect(test).assertEqual('success');
            }
            else{
                console.info('MediaQuery rmeoveListener fail');
                expect(test).assertEqual('fail');
            }
        }
        mMediaQueryList.addListener(maxWidthMatch)
        mMediaQueryList.removeListener(maxWidthMatch)
        console.info('MediaQuery removeListener end')
    });

    /**
     * @tc.name   maxHeight
     * @tc.number maxHeight
     * @tc.desc   maxHeight
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('maxHeight', Level.LEVEL0, function() {
        console.info('maxHeight start');
        var mMediaQueryList = mediaquery.matchMedia('(max-width:10000)');
//        mMediaQueryList.onreadystatechange = function(){
            function maxHeightMatch(e){
                if(e.matches){
                    //do something
                    console.info('MediaQuery maxHeight success');
                    expect(test).assertEqual('success');
                }
                else{
                    console.info('MediaQuery maxHeight fail');
                    expect(test).assertEqual('fail');
                }
            }
       // }

        mMediaQueryList.addListener(maxHeightMatch)
        console.info('MediaQuery maxHeight end')
    });

    /**
     * @tc.name   deviceType
     * @tc.number deviceType
     * @tc.desc   deviceType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('deviceType', Level.LEVEL0, function() {
        console.info('deviceType start');
        var mMediaQueryList = mediaquery.matchMedia('(deviceType:phone)');
        function deviceTypeMatch(e){
            if(e.matches){
                //do something
                console.info('MediaQuery deviceType success');
                expect(test).assertEqual('success');
            }
            else{
                console.info('MediaQuery deviceType fail');
                expect(test).assertEqual('fail');
            }
        }
        mMediaQueryList.addListener(deviceTypeMatch)
        console.info('MediaQuery deviceType end')
    });

    /**
     * @tc.name   logicOnly
     * @tc.number logicOnly
     * @tc.desc   logicOnly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('logicOnly', Level.LEVEL0, function() {
        console.info('MediaQuery logicOnly start');
        var mMediaQueryList = mediaquery.matchMedia('only screen and(deviceType:phone)and(max-height:100000)');
//        mMediaQueryList.onreadystatechange = function(){
        function logicOnlyMatch(e){
            if(e.matches){
                //do something
                console.info('MediaQuery logicOnly success');
                expect(test).assertEqual('success');
            }
            else{
                console.info('MediaQuery logicOnly fail');
                expect(test).assertEqual('fail');
            }
        }
        mMediaQueryList.addListener(logicOnlyMatch)
        console.info('MediaQuery logicOnly end')
        //}
    });

    /**
     * @tc.name   logicNot
     * @tc.number logicNot
     * @tc.desc   logicNot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('logicNot', Level.LEVEL0, function() {
        console.info('logicOnly start');
        var mMediaQueryList = mediaquery.matchMedia('not screen and(deviceType:tv)');
//      mMediaQueryList.onreadystatechange = function(){
        function logicNotMatch(e){
            if(e.matches){
                //do something
                console.info('MediaQuery logicNot success');
                expect(test).assertEqual('success');
            }
            else{
                console.info('MediaQuery logicNot fail');
                expect(test).assertEqual('fail');
            }
        }
        mMediaQueryList.addListener(logicNotMatch)
        console.info('MediaQuery logicNot end')
        //}
    });

    /**
     * @tc.name   logicAnd
     * @tc.number logicAnd
     * @tc.desc   logicAnd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('logicAnd', Level.LEVEL0, function() {
        console.info('MediaQuery logicAnd start');
        var mMediaQueryList = mediaquery.matchMedia('screen and(deviceType:phone)');
        function logicAndMatch(e){
            if(e.matches){
                //do something
                expect(e.matches).assertEqual(true)
                console.info('MediaQuery logicAnd success');
                expect(test).assertEqual('success');
            }
            else{
                expect(e.matches).assertEqual(true)
                console.info('MediaQuery logicAnd fail');
                expect(test).assertEqual('fail');
            }
        }
        mMediaQueryList.addListener(logicAndMatch)
        console.info('MediaQuery logicAnd end')
    });

    /**
     * @tc.name   logicComma
     * @tc.number logicComma
     * @tc.desc   logicComma
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('logicComma', Level.LEVEL0, function() {
        console.info('MediaQuery logicComma start');
        var mMediaQueryList = mediaquery.matchMedia('screen and(min-height:0),(round-screen:true)');
        function logicCommaMatch(e){
            if(e.matches){
                //do something
                expect(e.matches).assertEqual(true)
                console.info('MediaQuery logicComma success');
                expect(test).assertEqual('success');
            }
            else{
                expect(e.matches).assertEqual(true)
                console.info('MediaQuery logicComma fail');
                expect(test).assertEqual('fail');
            }
        }
        mMediaQueryList.addListener(logicCommaMatch)
        console.info('MediaQuery logicComma end')
    });

    /**
     * @tc.name   logicOr
     * @tc.number logicOr
     * @tc.desc   logicOr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('logicOr', Level.LEVEL0, function() {
        console.info('MediaQuery logicOr start');
        var mMediaQueryList = mediaquery.matchMedia('screen and(max-device-height:2000)or(round-screen:true)');
        function logicOrMatch(e){
            if(e.matches){
                //do something
                expect(e.matches).assertEqual(true)
                console.info('MediaQuery logicOr success');
                expect(test).assertEqual('success');
            }
            else{
                expect(e.matches).assertEqual(true)
                console.info('MediaQuery logicOr fail');
                expect(test).assertEqual('fail');
            }
        }
        mMediaQueryList.addListener(logicOrMatch)
        console.info('MediaQuery logicOr end')
    });

    /**
     * @tc.name   logic1
     * @tc.number logic1
     * @tc.desc   logic1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('logic1', Level.LEVEL0, function() {
        console.info('MediaQuery logic>= start');
        var mMediaQueryList = mediaquery.matchMedia('screen and(height>=0)');
        function logicOrMatch(e){
            if(e.matches){
                //do something
                expect(e.matches).assertEqual(true)
                console.info('MediaQuery logic>= success');
                expect(test).assertEqual('success');
            }
            else{
                expect(e.matches).assertEqual(true)
                console.info('MediaQuery logic>= fail');
                expect(test).assertEqual('fail');
            }
        }
        mMediaQueryList.addListener(logicOrMatch)
        console.info('MediaQuery logic>= end')
    })
});}
