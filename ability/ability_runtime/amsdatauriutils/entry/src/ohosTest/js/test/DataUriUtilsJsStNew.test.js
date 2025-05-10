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
import dataUriUtils from '@ohos.app.ability.dataUriUtils'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'

export default function DataUriUtilsJsStNew() {
  describe('DataUriUtilsJsStNew', function () {

    /*
    * @tc.number: Sub_Ability_AbilityBase_dataUriUtils_getId_0100
    * @tc.name: getId : Obtains the ID attached to the end of the path component of the given URI.
    * @tc.desc: Check the return value of the interface
    */
    it('Sub_Ability_AbilityBase_dataUriUtils_getId_0100', Level.LEVEL0, function (done) {
      console.log('dataUriUtils getId start1');
      var result = dataUriUtils.getId("com.ix.dataUriUtils/1221");
      console.log('dataUriUtils getId URI : ' + result);

      expect(typeof(result)).assertEqual("number");
      expect(result).assertEqual(1221);
      console.log('dataUriUtils getId_test start1 successful');
      done();
    })

    /*
    * @tc.number: Sub_Ability_AbilityBase_dataUriUtils_getId_0200
    * @tc.name: getId : Obtains the ID attached to the end of the path component of the given URI.
    * @tc.desc: Check the return value of the interface
    */
    it('Sub_Ability_AbilityBase_dataUriUtils_getId_0200', Level.LEVEL0, function (done) {
      try{
        console.log('dataUriUtils getId start2 ');
        var result = dataUriUtils.getId("com.ix.dataUriUtils1221");
        console.log('dataUriUtils getId URI : ' + result);
        expect().assertFail();
        done();
      }catch(err){
        console.log('dataUriUtils getId URI catch: ' + err?.code);
        expect(err?.code).assertEqual(401);
        done();
      }
    })

    /*
    * @tc.number: Sub_Ability_AbilityBase_dataUriUtils_getId_0300
    * @tc.name: getId : Obtains the ID attached to the end of the path component of the given URI.
    * @tc.desc: Check the return value of the interface
    */
    it('Sub_Ability_AbilityBase_dataUriUtils_getId_0300', Level.LEVEL0, function (done) {
      console.log('dataUriUtils getId start3 ');
      var result = dataUriUtils.getId("com.ix.dataUriUtils/11234567890");
      console.log('dataUriUtils getId URI : ' + result);
      expect(typeof(result)).assertEqual("number");
      expect(result).assertEqual(11234567890);
      console.log('dataUriUtils getId_test start3 successful ');
      done();
    })

    /*
    * @tc.number: Sub_Ability_AbilityBase_dataUriUtils_getId_0400
    * @tc.name: getId : Obtains the ID attached to the end of the path component of the given URI.
    * @tc.desc: Check the return value of the interface
    */
    it('Sub_Ability_AbilityBase_dataUriUtils_getId_0400', Level.LEVEL0, function (done) {
      try{
        console.log('dataUriUtils getId start4 ');
        var result = dataUriUtils.getId("com.ix.dataUriUtils");
        console.log('dataUriUtils getId URI : ' + result);
        expect().assertFail();
        done();
      }catch(err){
        console.log('dataUriUtils getId URI catch: ' + err?.code);
        expect(err?.code).assertEqual(401);
        done();
      }
      done();
    })

    /*
    * @tc.number: Sub_Ability_AbilityBase_dataUriUtils_getId_0500
    * @tc.name: getId : Obtains the ID attached to the end of the path component of the given URI.
    * @tc.desc: Check the return value of the interface
    */
    it('Sub_Ability_AbilityBase_dataUriUtils_getId_0500', Level.LEVEL0, function (done) {
      console.log('dataUriUtils getId start5 ');
      var result = dataUriUtils.getId("com.ix.dataUriUtils/-777");
      console.log('dataUriUtils getId URI : ' + result);//-777

      expect(typeof(result)).assertEqual("number");
      expect(result).assertEqual(-777);
      console.log('dataUriUtils getId_test start5 successful ');

      done();
    })

    /*
    * @tc.number: Sub_Ability_AbilityBase_dataUriUtils_deleteId_0600
    * @tc.name: Updates the ID in the specified dataUri.
    * @tc.desc: Check the return value of the interface
    */
    it('Sub_Ability_AbilityBase_dataUriUtils_getId_0600', Level.LEVEL0, function (done) {
      console.log('dataUriUtils attachId start6 ');
      try{
        var result = dataUriUtils.getId(undefined);
        console.log('dataUriUtils getId URI : ' + result);//-777
        expect().assertFail();
        done();
      }catch(err){
        console.log('dataUriUtils getId URI catch: ' + err?.code);
        expect(err?.code).assertEqual(401);
        done();
      }
    })
    /*
    * @tc.number: Sub_Ability_AbilityBase_dataUriUtils_attachId_0100
    * @tc.name: Attaches the given ID to the end of the path component of the given URI.
    * @tc.desc: Check the return value of the interface
    */
    it('Sub_Ability_AbilityBase_dataUriUtils_attachId_0100', Level.LEVEL0, function (done) {
      console.log('dataUriUtils attachId start1 ');
      var idint = 1122;
      var result = dataUriUtils.attachId("com.ix.dataUriUtils",idint);
      console.log('dataUriUtils attachId URI :' + result)

      expect(typeof(result)).assertEqual("string");
      expect(result).assertEqual("com.ix.dataUriUtils/1122");
      console.log('dataUriUtils attachId_test start1 successful ');

      done();
    })

    /*
    * @tc.number: Sub_Ability_AbilityBase_dataUriUtils_attachId_0200
    * @tc.name: Attaches the given ID to the end of the path component of the given URI.
    * @tc.desc: Check the return value of the interface
    */
    it('Sub_Ability_AbilityBase_dataUriUtils_attachId_0200', Level.LEVEL0, function (done) {
      console.log('dataUriUtils attachId start2 ');
      var idint = 0;
      var result = dataUriUtils.attachId("com.ix.dataUriUtils/777",idint);
      console.log('dataUriUtils attachId URI :' + result)

      expect(typeof(result)).assertEqual("string");
      expect(result).assertEqual("com.ix.dataUriUtils/777/0");
      console.log('dataUriUtils attachId_test start2 successful ');

      done();
    })

    /*
    * @tc.number: Sub_Ability_AbilityBase_dataUriUtils_attachId_0300
    * @tc.name: Attaches the given ID to the end of the path component of the given URI.
    * @tc.desc: Check the return value of the interface
    */
    it('Sub_Ability_AbilityBase_dataUriUtils_attachId_0300', Level.LEVEL0, function (done) {
      console.log('dataUriUtils attachId start3 ');
      var idint = 456789;
      var result = dataUriUtils.attachId("com.ix.dataUriUtils/123",idint);
      console.log('dataUriUtils attachId URI :' + result)

      expect(typeof(result)).assertEqual("string");
      expect(result).assertEqual("com.ix.dataUriUtils/123/456789");
      console.log('dataUriUtils attachId_test start3 successful ');

      done();
    })

    /*
    * @tc.number: Sub_Ability_AbilityBase_dataUriUtils_attachId_0400
    * @tc.name: Attaches the given ID to the end of the path component of the given URI.
    * @tc.desc: Check the return value of the interface
    */
    it('Sub_Ability_AbilityBase_dataUriUtils_attachId_0400', Level.LEVEL0, function (done) {
      console.log('dataUriUtils attachId start4 ');
      var idint = 123456789011;
      var result = dataUriUtils.attachId("com.ix.dataUriUtils",idint);
      console.log('dataUriUtils attachId URI :' + result)

      expect(typeof(result)).assertEqual("string");
      expect(result).assertEqual("com.ix.dataUriUtils/123456789011");
      console.log('dataUriUtils attachId_test start4 successful ');

      done();
    })

    /*
    * @tc.number: Sub_Ability_AbilityBase_dataUriUtils_attachId_0500
    * @tc.name: Attaches the given ID to the end of the path component of the given URI.
    * @tc.desc: Check the return value of the interface
    */
    it('Sub_Ability_AbilityBase_dataUriUtils_attachId_0500', Level.LEVEL0, function (done) {
      console.log('dataUriUtils attachId start5 ');
      var idint = -1;
      var result = dataUriUtils.attachId("com.ix.dataUriUtils",idint);
      console.log('dataUriUtils attachId URI :' + result)

      expect(typeof(result)).assertEqual("string");
      expect(result).assertEqual("com.ix.dataUriUtils/-1");
      console.log('dataUriUtils attachId_test start5 successful ');

      done();
    })


    /*
    * @tc.number: Sub_Ability_AbilityBase_dataUriUtils_deleteId_0600
    * @tc.name: Updates the ID in the specified dataUri.
    * @tc.desc: Check the return value of the interface
    */
    it('Sub_Ability_AbilityBase_dataUriUtils_attachId_0600', Level.LEVEL0, function (done) {
      console.log('dataUriUtils attachId start6 ');
      try{
        var idint = -1;
        var result = dataUriUtils.attachId(undefined, idint);
        console.log('dataUriUtils attachId URI :' + result)
        expect().assertFail();
        done();
      }catch(err){
        console.log('dataUriUtils attachId URI catch: ' + err?.code);
        expect(err?.code).assertEqual(401);
        done();
      }
    })

    /*
    * @tc.number: Sub_Ability_AbilityBase_dataUriUtils_deleteId_0100
    * @tc.name: Deletes the ID from the end of the path component of the given URI.
    * @tc.desc: Check the return value of the interface
    */
    it('Sub_Ability_AbilityBase_dataUriUtils_deleteId_0100', Level.LEVEL0, function (done) {
      try{
        console.log('dataUriUtils deleteId start1 ');
        var result = dataUriUtils.deleteId("com.ix.dataUriUtils");
        console.log('dataUriUtils deleteId URI : ' + result);
        expect().assertFail();
        done();
      }catch(err){
        console.log('dataUriUtils deleteId URI catch: ' + err?.code);
        expect(err?.code).assertEqual(401);
        done();
      }
    })

    /*
    * @tc.number: Sub_Ability_AbilityBase_dataUriUtils_deleteId_0200
    * @tc.name: Deletes the ID from the end of the path component of the given URI.
    * @tc.desc: Check the return value of the interface
    */
    it('Sub_Ability_AbilityBase_dataUriUtils_deleteId_0200', Level.LEVEL0, function (done) {
      console.log('dataUriUtils deleteId start2 ');
      var result = dataUriUtils.deleteId("com.ix.dataUriUtils/1122");
      console.log('dataUriUtils deleteId URI : ' + result);

      expect(typeof(result)).assertEqual("string");
      expect(result).assertEqual("com.ix.dataUriUtils");
      console.log('dataUriUtils deleteId_test start2 successful ');

      done();
    })

    /*
    * @tc.number: Sub_Ability_AbilityBase_dataUriUtils_deleteId_0300
    * @tc.name: Deletes the ID from the end of the path component of the given URI.
    * @tc.desc: Check the return value of the interface
    */
    it('Sub_Ability_AbilityBase_dataUriUtils_deleteId_0300', Level.LEVEL0, function (done) {
      try{
        console.log('dataUriUtils deleteId start3 ');
        var result = dataUriUtils.deleteId("com.ix.dataUriUtils1122");
        console.log('dataUriUtils deleteId URI : ' + result);
        expect().assertFail();
        done();
      }catch(err){
        console.log('dataUriUtils deleteId URI catch: ' + err?.code);
        expect(err?.code).assertEqual(401);
        done();
      }
    })

    /*
    * @tc.number: Sub_Ability_AbilityBase_dataUriUtils_deleteId_0400
    * @tc.name: Deletes the ID from the end of the path component of the given URI.
    * @tc.desc: Check the return value of the interface
    */
    it('Sub_Ability_AbilityBase_dataUriUtils_deleteId_0400', Level.LEVEL0, function (done) {
      console.log('dataUriUtils deleteId start4 ');
      var result = dataUriUtils.deleteId("com.ix.dataUriUtils/-1");
      console.log('dataUriUtils deleteId URI : ' + result);

      expect(typeof(result)).assertEqual("string");
      expect(result).assertEqual("com.ix.dataUriUtils");
      console.log('dataUriUtils deleteId_test start4 successful ');

      done();
    })

    /*
    * @tc.number: Sub_Ability_AbilityBase_dataUriUtils_deleteId_0500
    * @tc.name: Deletes the ID from the end of the path component of the given URI.
    * @tc.desc: Check the return value of the interface
    */
    it('Sub_Ability_AbilityBase_dataUriUtils_deleteId_0500', Level.LEVEL0, function (done) {
      console.log('dataUriUtils deleteId start5 ');
      var result = dataUriUtils.deleteId("com.ix.dataUriUtils/1122/2211");
      console.log('dataUriUtils deleteId URI : ' + result);

      expect(typeof(result)).assertEqual("string");
      expect(result).assertEqual("com.ix.dataUriUtils/1122");
      console.log('dataUriUtils deleteId_test start5 successful ');

      done();
    })

    /*
    * @tc.number: Sub_Ability_AbilityBase_dataUriUtils_deleteId_0600
    * @tc.name: Updates the ID in the specified dataUri.
    * @tc.desc: Check the return value of the interface
    */
    it('Sub_Ability_AbilityBase_dataUriUtils_deleteId_0600', Level.LEVEL0, function (done) {
      console.log('dataUriUtils deleteId start6 ');
      try{
        console.log('dataUriUtils deleteId start6 ');
        var result = dataUriUtils.deleteId(undefined);
        console.log('dataUriUtils deleteId URI : ' + result);
        expect().assertFail();
        done();
      }catch(err){
        console.log('dataUriUtils deleteId URI catch: ' + err?.code);
        expect(err?.code).assertEqual(401);
        done();
      }
    })

    /*
    * @tc.number: Sub_Ability_AbilityBase_dataUriUtils_updateId_0100
    * @tc.name: Updates the ID in the specified dataUri.
    * @tc.desc: Check the return value of the interface
    */
    it('Sub_Ability_AbilityBase_dataUriUtils_updateId_0100', Level.LEVEL0, function (done) {
      console.log('dataUriUtils updateId start1 ');
      try{
        var idint = 1122;
        var result = dataUriUtils.updateId("com.ix.dataUriUtils",idint);
        console.log('updateId updateId URI : ' + result);
        expect().assertFail();
        done();
      }catch(err){
        console.log('updateId updateId URI catch: ' + err?.code);
        expect(err?.code).assertEqual(401);
        done();
      }
    })

    /*
    * @tc.number: Sub_Ability_AbilityBase_dataUriUtils_updateId_0200
    * @tc.name: Updates the ID in the specified dataUri.
    * @tc.desc: Check the return value of the interface
    */
    it('Sub_Ability_AbilityBase_dataUriUtils_updateId_0200', Level.LEVEL0, function (done) {
      console.log('dataUriUtils updateId start2 ');
      try{
        var idint = 1122;
        var result = dataUriUtils.updateId("com.ix.dataUriUtils/",idint)
        console.log('updateId updateId URI : ' + result);
        expect().assertFail();
        done();
      }catch(err){
        console.log('updateId updateId URI catch: ' + err?.code);
        expect(err?.code).assertEqual(401);
        done();
      }
    })

    /*
    * @tc.number: Sub_Ability_AbilityBase_dataUriUtils_updateId_0300
    * @tc.name: Updates the ID in the specified dataUri.
    * @tc.desc: Check the return value of the interface
    */
    it('Sub_Ability_AbilityBase_dataUriUtils_updateId_0300', Level.LEVEL0, function (done) {
      console.log('dataUriUtils updateId start3 ');
      var idint = 3344;
      var result = dataUriUtils.updateId("com.ix.dataUriUtils/-1",idint)
      console.log('updateId updateId URI : ' + result);

      expect(typeof(result)).assertEqual("string");
      expect(result).assertEqual("com.ix.dataUriUtils/3344");
      console.log('dataUriUtils updateId_test start3 successful ');

      done();
    })

    /*
    * @tc.number: Sub_Ability_AbilityBase_dataUriUtils_updateId_0400
    * @tc.name: Updates the ID in the specified dataUri.
    * @tc.desc: Check the return value of the interface
    */
    it('Sub_Ability_AbilityBase_dataUriUtils_updateId_0400', Level.LEVEL0, function (done) {
      console.log('dataUriUtils updateId start4 ');
      var idint = 5566;
      var result = dataUriUtils.updateId("com.ix.dataUriUtils/123456789011",idint)
      console.log('updateId updateId URI : ' + result);

      expect(typeof(result)).assertEqual("string");
      expect(result).assertEqual("com.ix.dataUriUtils/5566");
      console.log('dataUriUtils updateId_test start4 successful ');

      done();
    })

    /*
    * @tc.number: Sub_Ability_AbilityBase_dataUriUtils_updateId_0500
    * @tc.name: Updates the ID in the specified dataUri.
    * @tc.desc: Check the return value of the interface
    */
    it('Sub_Ability_AbilityBase_dataUriUtils_updateId_0500', Level.LEVEL0, function (done) {
      console.log('dataUriUtils updateId start5 ');

      var idint = 0;
      expect(typeof(idint)).assertEqual("number");
      console.log('dataUriUtils updateId start666 ');

      var result = dataUriUtils.updateId("com.ix.dataUriUtils/1122",idint)
      console.log('updateId updateId URI : ' + result);
      expect(typeof(result)).assertEqual("string");
      expect(result).assertEqual("com.ix.dataUriUtils/0");
      done();
    })

    /*
    * @tc.number: Sub_Ability_AbilityBase_dataUriUtils_updateId_0600
    * @tc.name: Updates the ID in the specified dataUri.
    * @tc.desc: Check the return value of the interface
    */
    it('Sub_Ability_AbilityBase_dataUriUtils_updateId_0600', Level.LEVEL0, function (done) {
      console.log('dataUriUtils updateId start5 ');
      var idint = 0;
      expect(typeof(idint)).assertEqual("number");
      console.log('dataUriUtils updateId start666 ');
      try{
        var result = dataUriUtils.updateId(undefined, idint)
        console.log('updateId updateId URI : ' + result);
        expect().assertFail();
        done();
      }catch(err){
        console.log('updateId updateId URI catch: ' + err?.code);
        expect(err?.code).assertEqual(401);
        done();
      }
    })
  })
}
