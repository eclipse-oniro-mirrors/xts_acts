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
import dataUriUtils from '@ohos.ability.dataUriUtils'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'

export default function ActsDataUriUtilsTest() {
describe('ActsDataUriUtilsTest', function () {

    /**
     * @tc.name   ACTS_getId_0100
     * @tc.number ACTS_getId_0100
     * @tc.desc   Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_getId_0100', Level.LEVEL0, function (done) {
        console.log('dataUriUtils getId start1');
        var result = dataUriUtils.getId("com.ix.dataUriUtils/1221");
        console.log('dataUriUtils getId URI : ' + result);

        expect(typeof(result)).assertEqual("number");
        expect(result).assertEqual(1221);
        console.log('dataUriUtils getId_test start1 successful');
        done();
    })

    /**
     * @tc.name   ACTS_getId_0200
     * @tc.number ACTS_getId_0200
     * @tc.desc   Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_getId_0200', Level.LEVEL0, function (done) {
        console.log('dataUriUtils getId start2 ');
        var result = dataUriUtils.getId("com.ix.dataUriUtils1221");
        console.log('dataUriUtils getId URI : ' + result);

        expect(typeof(result)).assertEqual("number");
        expect(result).assertEqual(-1);
        console.log('dataUriUtils getId_test start2 successful ');

        done();
    })

    /**
     * @tc.name   ACTS_getId_0300
     * @tc.number ACTS_getId_0300
     * @tc.desc   Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_getId_0300', Level.LEVEL0, function (done) {
        console.log('dataUriUtils getId start3 ');
        var result = dataUriUtils.getId("com.ix.dataUriUtils/11234567890");
        console.log('dataUriUtils getId URI : ' + result);

        expect(typeof(result)).assertEqual("number");
        expect(result).assertEqual(11234567890);
        console.log('dataUriUtils getId_test start3 successful ');

        done();
    })

    /**
     * @tc.name   ACTS_getId_0400
     * @tc.number ACTS_getId_0400
     * @tc.desc   Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_getId_0400', Level.LEVEL0, function (done) {
        console.log('dataUriUtils getId start4 ');
        var result = dataUriUtils.getId("com.ix.dataUriUtils");
        console.log('dataUriUtils getId URI : ' + result);

        expect(typeof(result)).assertEqual("number");
        expect(result).assertEqual(-1);
        console.log('dataUriUtils getId_test start4 successful ');

        done();
    })

    /**
     * @tc.name   ACTS_getId_0500
     * @tc.number ACTS_getId_0500
     * @tc.desc   Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_getId_0500', Level.LEVEL0, function (done) {
        console.log('dataUriUtils getId start5 ');
        var result = dataUriUtils.getId("com.ix.dataUriUtils/-777");
        console.log('dataUriUtils getId URI : ' + result);//-777

        expect(typeof(result)).assertEqual("number");
        expect(result).assertEqual(-777);
        console.log('dataUriUtils getId_test start5 successful ');

        done();
    })

    /**
     * @tc.name   ACTS_attachId_0100
     * @tc.number ACTS_attachId_0100
     * @tc.desc   Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_attachId_0100', Level.LEVEL0, function (done) {
        console.log('dataUriUtils attachId start1 ');
        var idint = 1122;
        var result = dataUriUtils.attachId("com.ix.dataUriUtils",idint);
        console.log('dataUriUtils attachId URI :' + result)

        expect(typeof(result)).assertEqual("string");
        expect(result).assertEqual("com.ix.dataUriUtils/1122");
        console.log('dataUriUtils attachId_test start1 successful ');

        done();
    })

    /**
     * @tc.name   ACTS_attachId_0200
     * @tc.number ACTS_attachId_0200
     * @tc.desc   Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_attachId_0200', Level.LEVEL0, function (done) {
        console.log('dataUriUtils attachId start2 ');
        var idint = 0;
        var result = dataUriUtils.attachId("com.ix.dataUriUtils/777",idint);
        console.log('dataUriUtils attachId URI :' + result)

        expect(typeof(result)).assertEqual("string");
        expect(result).assertEqual("com.ix.dataUriUtils/777/0");
        console.log('dataUriUtils attachId_test start2 successful ');

        done();
    })

    /**
     * @tc.name   ACTS_attachId_0300
     * @tc.number ACTS_attachId_0300
     * @tc.desc   Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_attachId_0300', Level.LEVEL0, function (done) {
        console.log('dataUriUtils attachId start3 ');
        var idint = 456789;
        var result = dataUriUtils.attachId("com.ix.dataUriUtils/123",idint);
        console.log('dataUriUtils attachId URI :' + result)

        expect(typeof(result)).assertEqual("string");
        expect(result).assertEqual("com.ix.dataUriUtils/123/456789");
        console.log('dataUriUtils attachId_test start3 successful ');

        done();
    })

    /**
     * @tc.name   ACTS_attachId_0400
     * @tc.number ACTS_attachId_0400
     * @tc.desc   Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_attachId_0400', Level.LEVEL0, function (done) {
        console.log('dataUriUtils attachId start4 ');
        var idint = 123456789011;
        var result = dataUriUtils.attachId("com.ix.dataUriUtils",idint);
        console.log('dataUriUtils attachId URI :' + result)

        expect(typeof(result)).assertEqual("string");
        expect(result).assertEqual("com.ix.dataUriUtils/123456789011");
        console.log('dataUriUtils attachId_test start4 successful ');

        done();
    })

    /**
     * @tc.name   ACTS_attachId_0500
     * @tc.number ACTS_attachId_0500
     * @tc.desc   Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_attachId_0500', Level.LEVEL0, function (done) {
        console.log('dataUriUtils attachId start5 ');
        var idint = -1;
        var result = dataUriUtils.attachId("com.ix.dataUriUtils",idint);
        console.log('dataUriUtils attachId URI :' + result)

        expect(typeof(result)).assertEqual("string");
        expect(result).assertEqual("com.ix.dataUriUtils/-1");
        console.log('dataUriUtils attachId_test start5 successful ');

        done();
    })

    /**
     * @tc.name   ACTS_deleteId_0100
     * @tc.number ACTS_deleteId_0100
     * @tc.desc   Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_deleteId_0100', Level.LEVEL0, function (done) {
        console.log('dataUriUtils deleteId start1 ');
        var result = dataUriUtils.deleteId("com.ix.dataUriUtils");
        console.log('dataUriUtils deleteId URI : ' + result);

        expect(typeof(result)).assertEqual("string");
        expect(result).assertEqual("com.ix.dataUriUtils");
        console.log('dataUriUtils deleteId_test start1 successful ');

        done();
    })

    /**
     * @tc.name   ACTS_deleteId_0200
     * @tc.number ACTS_deleteId_0200
     * @tc.desc   Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_deleteId_0200', Level.LEVEL0, function (done) {
        console.log('dataUriUtils deleteId start2 ');
        var result = dataUriUtils.deleteId("com.ix.dataUriUtils/1122");
        console.log('dataUriUtils deleteId URI : ' + result);

        expect(typeof(result)).assertEqual("string");
        expect(result).assertEqual("com.ix.dataUriUtils");
        console.log('dataUriUtils deleteId_test start2 successful ');

        done();
    })

    /**
     * @tc.name   ACTS_deleteId_0300
     * @tc.number ACTS_deleteId_0300
     * @tc.desc   Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_deleteId_0300', Level.LEVEL0, function (done) {
        console.log('dataUriUtils deleteId start3 ');
        var result = dataUriUtils.deleteId("com.ix.dataUriUtils1122");
        console.log('dataUriUtils deleteId URI : ' + result);

        expect(typeof(result)).assertEqual("string");
        expect(result).assertEqual("com.ix.dataUriUtils1122");
        console.log('dataUriUtils deleteId_test start3 successful ');

        done();
    })

    /**
     * @tc.name   ACTS_deleteId_0400
     * @tc.number ACTS_deleteId_0400
     * @tc.desc   Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_deleteId_0400', Level.LEVEL0, function (done) {
        console.log('dataUriUtils deleteId start4 ');
        var result = dataUriUtils.deleteId("com.ix.dataUriUtils/-1");
        console.log('dataUriUtils deleteId URI : ' + result);

        expect(typeof(result)).assertEqual("string");
        expect(result).assertEqual("com.ix.dataUriUtils");
        console.log('dataUriUtils deleteId_test start4 successful ');

        done();
    })

    /**
     * @tc.name   ACTS_deleteId_0500
     * @tc.number ACTS_deleteId_0500
     * @tc.desc   Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_deleteId_0500', Level.LEVEL0, function (done) {
        console.log('dataUriUtils deleteId start5 ');
        var result = dataUriUtils.deleteId("com.ix.dataUriUtils/1122/2211");
        console.log('dataUriUtils deleteId URI : ' + result);

        expect(typeof(result)).assertEqual("string");
        expect(result).assertEqual("com.ix.dataUriUtils/1122");
        console.log('dataUriUtils deleteId_test start5 successful ');

        done();
    })

    /**
     * @tc.name   ACTS_updateId_0100
     * @tc.number ACTS_updateId_0100
     * @tc.desc   Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_updateId_0100', Level.LEVEL0, function (done) {
        console.log('dataUriUtils updateId start1 ');
        var idint = 1122;
        var result = dataUriUtils.updateId("com.ix.dataUriUtils",idint);
        console.log('updateId updateId URI : ' + result);

        expect(typeof(result)).assertEqual("string");
        expect(result).assertEqual("com.ix.dataUriUtils");
        console.log('dataUriUtils updateId_test start1 successful ');

        done();
    })

    /**
     * @tc.name   ACTS_updateId_0200
     * @tc.number ACTS_updateId_0200
     * @tc.desc   Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_updateId_0200', Level.LEVEL0, function (done) {
        console.log('dataUriUtils updateId start2 ');
        var idint = 1122;
        var result = dataUriUtils.updateId("com.ix.dataUriUtils/",idint)
        console.log('updateId updateId URI : ' + result);

        expect(typeof(result)).assertEqual("string");
        expect(result).assertEqual("com.ix.dataUriUtils/");
        console.log('dataUriUtils updateId_test start2 successful ');

        done();
    })

    /**
     * @tc.name   ACTS_updateId_0300
     * @tc.number ACTS_updateId_0300
     * @tc.desc   Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_updateId_0300', Level.LEVEL0, function (done) {
        console.log('dataUriUtils updateId start3 ');
        var idint = 3344;
        var result = dataUriUtils.updateId("com.ix.dataUriUtils/-1",idint)
        console.log('updateId updateId URI : ' + result);

        expect(typeof(result)).assertEqual("string");
        expect(result).assertEqual("com.ix.dataUriUtils/3344");
        console.log('dataUriUtils updateId_test start3 successful ');

        done();
    })

    /**
     * @tc.name   ACTS_updateId_0400
     * @tc.number ACTS_updateId_0400
     * @tc.desc   Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_updateId_0400', Level.LEVEL0, function (done) {
        console.log('dataUriUtils updateId start4 ');
        var idint = 5566;
        var result = dataUriUtils.updateId("com.ix.dataUriUtils/123456789011",idint)
        console.log('updateId updateId URI : ' + result);

        expect(typeof(result)).assertEqual("string");
        expect(result).assertEqual("com.ix.dataUriUtils/5566");
        console.log('dataUriUtils updateId_test start4 successful ');

        done();
    })

    /**
     * @tc.name   ACTS_updateId_0500
     * @tc.number ACTS_updateId_0500
     * @tc.desc   Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_updateId_0500', Level.LEVEL0, function (done) {
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

    /**
     * @tc.name   ACTS_getId_0600
     * @tc.number ACTS_getId_0600
     * @tc.desc   Test getId with uri as empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ACTS_getId_0600', Level.LEVEL1, function (done) {
        console.log('ACTS_getId_0600 ' + 'dataUriUtils getId start with empty string');
        var result = dataUriUtils.getId("");
        console.log('ACTS_getId_0600 ' + 'dataUriUtils getId URI : ' + result);
        expect(result).assertEqual(-1);
        console.log('ACTS_getId_0600 ' + 'dataUriUtils getId_test with empty string successful');
        done();
    })

    /**
     * @tc.name   ACTS_getId_0700
     * @tc.number ACTS_getId_0700
     * @tc.desc   Test getId with uri as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ACTS_getId_0700', Level.LEVEL1, function (done) {
        console.log('ACTS_getId_0700 ' + 'dataUriUtils getId start with null');
        try {
            var result = dataUriUtils.getId(null);
            console.log('ACTS_getId_0700 ' + 'dataUriUtils getId URI : ' + result);
            expect(result).assertEqual(-1);
            done();
        } catch (err) {
            console.log('ACTS_getId_0700 ' + 'dataUriUtils getId error: ' + JSON.stringify(err));
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.name   ACTS_getId_0800
     * @tc.number ACTS_getId_0800
     * @tc.desc   Test getId with uri as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ACTS_getId_0800', Level.LEVEL1, function (done) {
        console.log('ACTS_getId_0800 ' + 'dataUriUtils getId start with undefined');
        try {
            var result = dataUriUtils.getId(undefined);
            console.log('ACTS_getId_0800 ' + 'dataUriUtils getId URI : ' + result);
            expect(result).assertEqual(-1);
            done();
        } catch (err) {
            console.log('ACTS_getId_0800 ' + 'dataUriUtils getId error: ' + JSON.stringify(err));
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.name   ACTS_attachId_0600
     * @tc.number ACTS_attachId_0600
     * @tc.desc   Test attachId with uri as empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ACTS_attachId_0600', Level.LEVEL1, function (done) {
        console.log('ACTS_attachId_0600 ' + 'dataUriUtils attachId start with empty string');
        var idint = 123;
        var result = dataUriUtils.attachId("", idint);
        console.log('ACTS_attachId_0600 ' + 'dataUriUtils attachId URI :' + result);
        expect(result).assertEqual("/123");
        console.log('ACTS_attachId_0600 ' + 'dataUriUtils attachId_test with empty string successful');
        done();
    })

    /**
     * @tc.name   ACTS_attachId_0700
     * @tc.number ACTS_attachId_0700
     * @tc.desc   Test attachId with uri as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ACTS_attachId_0700', Level.LEVEL1, function (done) {
        console.log('ACTS_attachId_0700 ' + 'dataUriUtils attachId start with null uri');
        var idint = 123;
        try {
            var result = dataUriUtils.attachId(null, idint);
            console.log('ACTS_attachId_0700 ' + 'dataUriUtils attachId URI :' + result);
            expect(result).assertEqual(null);
            done();
        } catch (err) {
            console.log('ACTS_attachId_0700 ' + 'dataUriUtils attachId error: ' + JSON.stringify(err));
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.name   ACTS_attachId_0800
     * @tc.number ACTS_attachId_0800
     * @tc.desc   Test attachId with uri as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ACTS_attachId_0800', Level.LEVEL1, function (done) {
        console.log('ACTS_attachId_0800 ' + 'dataUriUtils attachId start with undefined uri');
        var idint = 123;
        try {
            var result = dataUriUtils.attachId(undefined, idint);
            console.log('ACTS_attachId_0800 ' + 'dataUriUtils attachId URI :' + result);
            expect(result).assertEqual(undefined);
            done();
        } catch (err) {
            console.log('ACTS_attachId_0800 ' + 'dataUriUtils attachId error: ' + JSON.stringify(err));
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.name   ACTS_attachId_0900
     * @tc.number ACTS_attachId_0900
     * @tc.desc   Test attachId with id as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ACTS_attachId_0900', Level.LEVEL1, function (done) {
        console.log('ACTS_attachId_0900 ' + 'dataUriUtils attachId start with null id');
        try {
            var result = dataUriUtils.attachId("com.ix.dataUriUtils", null);
            console.log('ACTS_attachId_0900 ' + 'dataUriUtils attachId URI :' + result);
            expect(result).assertEqual("com.ix.dataUriUtils");
            done();
        } catch (err) {
            console.log('ACTS_attachId_0900 ' + 'dataUriUtils attachId error: ' + JSON.stringify(err));
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.name   ACTS_attachId_1000
     * @tc.number ACTS_attachId_1000
     * @tc.desc   Test attachId with id as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ACTS_attachId_1000', Level.LEVEL1, function (done) {
        console.log('ACTS_attachId_1000 ' + 'dataUriUtils attachId start with undefined id');
        try {
            var result = dataUriUtils.attachId("com.ix.dataUriUtils", undefined);
            console.log('ACTS_attachId_1000 ' + 'dataUriUtils attachId URI :' + result);
            expect(result).assertEqual("com.ix.dataUriUtils");
            done();
        } catch (err) {
            console.log('ACTS_attachId_1000 ' + 'dataUriUtils attachId error: ' + JSON.stringify(err));
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.name   ACTS_attachId_1100
     * @tc.number ACTS_attachId_1100
     * @tc.desc   Test attachId with uri as null and id as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ACTS_attachId_1100', Level.LEVEL1, function (done) {
        console.log('ACTS_attachId_1100 ' + 'dataUriUtils attachId start with both null');
        try {
            var result = dataUriUtils.attachId(null, null);
            console.log('ACTS_attachId_1100 ' + 'dataUriUtils attachId URI :' + result);
            expect(result).assertEqual(null);
            done();
        } catch (err) {
            console.log('ACTS_attachId_1100 ' + 'dataUriUtils attachId error: ' + JSON.stringify(err));
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.name   ACTS_attachId_1200
     * @tc.number ACTS_attachId_1200
     * @tc.desc   Test attachId with uri as undefined and id as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ACTS_attachId_1200', Level.LEVEL1, function (done) {
        console.log('ACTS_attachId_1200 ' + 'dataUriUtils attachId start with both undefined');
        try {
            var result = dataUriUtils.attachId(undefined, undefined);
            console.log('ACTS_attachId_1200 ' + 'dataUriUtils attachId URI :' + result);
            expect(result).assertEqual(undefined);
            done();
        } catch (err) {
            console.log('ACTS_attachId_1200 ' + 'dataUriUtils attachId error: ' + JSON.stringify(err));
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.name   ACTS_deleteId_0600
     * @tc.number ACTS_deleteId_0600
     * @tc.desc   Test deleteId with uri as empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ACTS_deleteId_0600', Level.LEVEL1, function (done) {
        console.log('ACTS_deleteId_0600 ' + 'dataUriUtils deleteId start with empty string');
        var result = dataUriUtils.deleteId("");
        console.log('ACTS_deleteId_0600 ' + 'dataUriUtils deleteId URI : ' + result);
        expect(result).assertEqual("");
        console.log('ACTS_deleteId_0600 ' + 'dataUriUtils deleteId_test with empty string successful');
        done();
    })

    /**
     * @tc.name   ACTS_deleteId_0700
     * @tc.number ACTS_deleteId_0700
     * @tc.desc   Test deleteId with uri as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ACTS_deleteId_0700', Level.LEVEL1, function (done) {
        console.log('ACTS_deleteId_0700 ' + 'dataUriUtils deleteId start with null');
        try {
            var result = dataUriUtils.deleteId(null);
            console.log('ACTS_deleteId_0700 ' + 'dataUriUtils deleteId URI : ' + result);
            expect(result).assertEqual(null);
            done();
        } catch (err) {
            console.log('ACTS_deleteId_0700 ' + 'dataUriUtils deleteId error: ' + JSON.stringify(err));
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.name   ACTS_deleteId_0800
     * @tc.number ACTS_deleteId_0800
     * @tc.desc   Test deleteId with uri as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ACTS_deleteId_0800', Level.LEVEL1, function (done) {
        console.log('ACTS_deleteId_0800 ' + 'dataUriUtils deleteId start with undefined');
        try {
            var result = dataUriUtils.deleteId(undefined);
            console.log('ACTS_deleteId_0800 ' + 'dataUriUtils deleteId URI : ' + result);
            expect(result).assertEqual(undefined);
            done();
        } catch (err) {
            console.log('ACTS_deleteId_0800 ' + 'dataUriUtils deleteId error: ' + JSON.stringify(err));
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.name   ACTS_updateId_0600
     * @tc.number ACTS_updateId_0600
     * @tc.desc   Test updateId with uri as empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ACTS_updateId_0600', Level.LEVEL1, function (done) {
        console.log('ACTS_updateId_0600 ' + 'dataUriUtils updateId start with empty string');
        var idint = 1234;
        var result = dataUriUtils.updateId("", idint);
        console.log('ACTS_updateId_0600 ' + 'updateId updateId URI : ' + result);
        expect(result).assertEqual("");
        console.log('ACTS_updateId_0600 ' + 'dataUriUtils updateId_test with empty string successful');
        done();
    })

    /**
     * @tc.name   ACTS_updateId_0700
     * @tc.number ACTS_updateId_0700
     * @tc.desc   Test updateId with uri as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ACTS_updateId_0700', Level.LEVEL1, function (done) {
        console.log('ACTS_updateId_0700 ' + 'dataUriUtils updateId start with null uri');
        var idint = 1234;
        try {
            var result = dataUriUtils.updateId(null, idint);
            console.log('ACTS_updateId_0700 ' + 'updateId updateId URI : ' + result);
            expect(result).assertEqual(null);
            done();
        } catch (err) {
            console.log('ACTS_updateId_0700 ' + 'dataUriUtils updateId error: ' + JSON.stringify(err));
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.name   ACTS_updateId_0800
     * @tc.number ACTS_updateId_0800
     * @tc.desc   Test updateId with uri as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ACTS_updateId_0800', Level.LEVEL1, function (done) {
        console.log('ACTS_updateId_0800 ' + 'dataUriUtils updateId start with undefined uri');
        var idint = 1234;
        try {
            var result = dataUriUtils.updateId(undefined, idint);
            console.log('ACTS_updateId_0800 ' + 'updateId updateId URI : ' + result);
            expect(result).assertEqual(undefined);
            done();
        } catch (err) {
            console.log('ACTS_updateId_0800 ' + 'dataUriUtils updateId error: ' + JSON.stringify(err));
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.name   ACTS_updateId_0900
     * @tc.number ACTS_updateId_0900
     * @tc.desc   Test updateId with id as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ACTS_updateId_0900', Level.LEVEL1, function (done) {
        console.log('ACTS_updateId_0900 ' + 'dataUriUtils updateId start with null id');
        try {
            var result = dataUriUtils.updateId("com.ix.dataUriUtils", null);
            console.log('ACTS_updateId_0900 ' + 'updateId updateId URI : ' + result);
            expect(result).assertEqual('com.ix.dataUriUtils');
            done();
        } catch (err) {
            console.log('ACTS_updateId_0900 ' + 'dataUriUtils updateId error: ' + JSON.stringify(err));
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.name   ACTS_updateId_1000
     * @tc.number ACTS_updateId_1000
     * @tc.desc   Test updateId with id as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ACTS_updateId_1000', Level.LEVEL1, function (done) {
        console.log('ACTS_updateId_1000 ' + 'dataUriUtils updateId start with undefined id');
        try {
            var result = dataUriUtils.updateId("com.ix.dataUriUtils", undefined);
            console.log('ACTS_updateId_1000 ' + 'updateId updateId URI : ' + result);
            expect(result).assertEqual('com.ix.dataUriUtils');
            done();
        } catch (err) {
            console.log('ACTS_updateId_1000 ' + 'dataUriUtils updateId error: ' + JSON.stringify(err));
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.name   ACTS_updateId_1100
     * @tc.number ACTS_updateId_1100
     * @tc.desc   Test updateId with both parameters as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ACTS_updateId_1100', Level.LEVEL1, function (done) {
        console.log('ACTS_updateId_1100 ' + 'dataUriUtils updateId start with both null');
        try {
            var result = dataUriUtils.updateId(null, null);
            console.log('ACTS_updateId_1100 ' + 'updateId updateId URI : ' + result);
            expect(result).assertEqual(null);
            done();
        } catch (err) {
            console.log('ACTS_updateId_1100 ' + 'dataUriUtils updateId error: ' + JSON.stringify(err));
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.name   ACTS_updateId_1200
     * @tc.number ACTS_updateId_1200
     * @tc.desc   Test updateId with both parameters as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ACTS_updateId_1200', Level.LEVEL1, function (done) {
        console.log('ACTS_updateId_1200 ' + 'dataUriUtils updateId start with both undefined');
        try {
            var result = dataUriUtils.updateId(undefined, undefined);
            console.log('ACTS_updateId_1200 ' + 'updateId updateId URI : ' + result);
            expect(result).assertEqual(undefined);
            done();
        } catch (err) {
            console.log('ACTS_updateId_1200 ' + 'dataUriUtils updateId error: ' + JSON.stringify(err));
            expect().assertFail();
            done();
        }
    })
})
}
