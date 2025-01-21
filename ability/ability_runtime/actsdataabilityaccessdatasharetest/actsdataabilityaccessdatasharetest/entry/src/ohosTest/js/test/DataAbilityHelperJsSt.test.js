/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
import featureAbility from '@ohos.ability.featureAbility'
import ohosDataAbility from '@ohos.data.dataAbility'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

export default function ActsDataAbilityHelperTest() {
describe('ActsDataAbilityHelperTest', function () {
    let dataAbilityUri = ("dataability:///com.example.dataabilityserver_fa.DataAbility");
    let dataShareUri = ("datashare:///com.example.dataabilityserver_fa.DataAbility");
    let columns = ['id', 'name', 'introduction']
    let DAHelper;
    let gSetTimeout = 500;
    let TAG = ''

    function sleep(delay) {
        let start = new Date().getTime();
        while (true) {
            if (new Date().getTime() - start > delay) {
                break;
            }
        }
    }

    beforeAll(async (done) => {
        console.debug('= ACTS_beforeAll ====<begin');
        try {
            DAHelper = featureAbility.acquireDataAbilityHelper(dataAbilityUri);
            console.debug('ACTS_beforeAll DAHelper ====> ' + DAHelper + " ,JSON. " + JSON.stringify(DAHelper));
            if(DAHelper == null){
                console.debug('ACTS_beforeAll DAHelper ====> DAHelper == null');
                return;
            }
        } catch (err) {
            console.error('=ACTS_beforeAll acquireDataAbilityHelper catch(err)====>' + err);
        }
        sleep(500);
        console.debug('= ACTS_beforeAll ====<end');
        done();
    })
    afterAll((done) => {
        console.debug('= ACTS_afterAll ====<begin');
        console.debug('= ACTS_afterAll ====<end');
        done();
    })

    /*
    * @tc.number: ACTS_DataAbilityAccessDataShare_Inset_0100
    * @tc.name: insert : insert data to DataShare by DataAbilityHelper
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_DataAbilityAccessDataShare_Inset_0100', 0, async function (done) {
        TAG = 'ACTS_DataAbilityAccessDataShare_Inset_0100';
        console.log(TAG + '====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        try {
            let insertValuesBucket = {'name':'C++', 'introduction':'Primer'};
            await DAHelper.insert(
                dataAbilityUri,
                insertValuesBucket,
                (err, data) => {
                    console.log(TAG + ' insert err, data====>'
                        + 'json err [ ' + JSON.stringify(err) + ' ], json data [ ' + JSON.stringify(data) + ' ]');
                    expect(data).assertEqual(1);
                    console.log(TAG + '====<end');
                    done();
            })
        } catch (err) {
            console.error(TAG + ' catch(err)====>' + err);
            expect(false).assertTrue();
        }
        console.log(TAG + '====<end');
    })

    /*
    * @tc.number: ACTS_DataAbilityAccessDataShare_Inset_0200
    * @tc.name: insert : insert data to DataShare by DataAbilityHelper
    * @tc.desc: Check the return value of the interface (by promise)
    */
    it('ACTS_DataAbilityAccessDataShare_Inset_0200', 0, async function (done) {
        TAG = 'ACTS_DataAbilityAccessDataShare_Inset_0200';
        console.log(TAG + '====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        try {
            let insertValuesBucket = {'name':'C++', 'introduction':'Primer'};
            DAHelper.insert(dataAbilityUri, insertValuesBucket)
                .then(function (data) {
                    console.log(TAG + ' then data====>'
                        + 'json data [ ' + JSON.stringify(data) + ' ]');
                    expect(data).assertEqual(2);
                    console.log(TAG + '====<end');
                    done();
                }).catch(function (err) {
                    console.log(TAG + ' catch err ====>'
                        + 'json err [ ' + JSON.stringify(err) + ' ]');
                    expect(false).assertTrue();
                    console.log(TAG + '====<end .catch');
                    done();
                });
        } catch (err) {
            console.error(TAG + ' catch(err)====>' + err);
            expect(false).assertTrue();
            console.log(TAG + '====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_DataAbilityAccessDataShare_Query_0100
    * @tc.name: Queries one or more data records in the database
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_DataAbilityAccessDataShare_Query_0100', 0, async function (done) {
        TAG = 'ACTS_DataAbilityAccessDataShare_Query_0100';
        console.log(TAG + '====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        try {
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('id', 1);
            await DAHelper.query(
                dataAbilityUri,
                columns,
                predicates,
                (err, data) => {
                    console.log(TAG + ' query err, data====>'
                        + 'json err [ ' + JSON.stringify(err) + ' ], json data [ ' + JSON.stringify(data) + ' ]');
                    expect(typeof (data)).assertEqual("object");
                    console.log(TAG + '====<end');
                    done();
                });
        } catch (err) {
            console.error(TAG + ' catch(err)====>' + err);
            console.log(TAG + '====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_DataAbilityAccessDataShare_Query_0200
    * @tc.name: Updates one or more data records in the database
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_DataAbilityAccessDataShare_Query_0200', 0, async function (done) {
        TAG = 'ACTS_DataAbilityAccessDataShare_Query_0200';
        console.log(TAG + '====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        try {
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('id', 2);
            let queryPromise = DAHelper.query(
                dataAbilityUri,
                columns,
                predicates
            );
            console.log(TAG + ' queryPromise ====>'
                + 'json queryPromise [ ' + JSON.stringify(queryPromise) + ' ]');
            expect(typeof (queryPromise)).assertEqual("object");
            console.log(TAG + '====<end');
            done();
        } catch (err) {
            console.error(TAG + ' query catch(err)====>' + err);
            console.log(TAG + '====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_DataAbilityAccessDataShare_Update_0100
    * @tc.name: Updates one or more data records in the database
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_DataAbilityAccessDataShare_Update_0100', 0, async function (done) {
        TAG = 'ACTS_DataAbilityAccessDataShare_Update_0100';
        console.log(TAG + '====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        try {
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('id', 1);
            let updateValuesBucket = {
                'name': 'Java',
                'introduction': 'Learner'
            };
            await DAHelper.update(
                dataAbilityUri,
                updateValuesBucket,
                predicates,
                (err, data) => {
                    console.log(TAG + ' update err, data====>'
                        + 'json err [ ' + JSON.stringify(err) + ' ], json data [ ' + JSON.stringify(data) + ' ]');
                    expect(data).assertEqual(1);
                    console.log(TAG + '====<end');
                    done();
                });
        } catch (err) {
            console.error(TAG + ' catch(err)====>' + err);
            console.log(TAG + '====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_DataAbilityAccessDataShare_Update_0200
    * @tc.name: Queries one or more data records in the database
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_DataAbilityAccessDataShare_Update_0200', 0, async function (done) {
        TAG = 'ACTS_DataAbilityAccessDataShare_Update_0200';
        console.log(TAG + '====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        try {
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('id', 2);
            let updateValuesBucket = {
                'name': 'Java',
                'introduction': 'Learner'
            };
            DAHelper.update(
                dataAbilityUri,
                updateValuesBucket,
                predicates
            ).then((data) => {
                console.log(TAG + ' then data====>'
                    + 'json data [ ' + JSON.stringify(data) + ' ]');
                expect(data).assertEqual(1);
                console.log(TAG + '====<end');
                done();
            }).catch((err) => {
                console.log(TAG + ' catch err ====>'
                    + 'json err [ ' + JSON.stringify(err) + ' ]');
                console.log(TAG + '====<end .catch');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.error(TAG + ' update catch(err)====>' + err);
            console.log(TAG + '====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_DataAbilityAccessDataShare_Delete_0100
    * @tc.name: Deletes one or more data records in the database
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_DataAbilityAccessDataShare_Delete_0100', 0, async function (done) {
        TAG = 'ACTS_DataAbilityAccessDataShare_Delete_0100';
        console.log(TAG + '====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        try {
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('id', 1);
            await DAHelper.delete(
                dataAbilityUri,
                predicates,
                (err, data) => {
                    console.log(TAG + ' delete err, data====>'
                        + 'json err [ ' + JSON.stringify(err) + ' ], json data [ ' + JSON.stringify(data) + ' ]');
                    expect(data).assertEqual(1);
                    console.log(TAG + '====<end');
                    done();
                });
        } catch (err) {
            console.error(TAG + ' catch(err)====>' + err);
            console.log(TAG + '====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_DataAbilityAccessDataShare_Delete_0200
    * @tc.name: Deletes one or more data records in the database
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_DataAbilityAccessDataShare_Delete_0200', 0, async function (done) {
        TAG = 'ACTS_DataAbilityAccessDataShare_Delete_0200';
        console.log(TAG + '====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        try {
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('id', 2);
            DAHelper.delete(
                dataAbilityUri,
                predicates
            ).then((data) => {
                console.log(TAG + ' then data====>'
                    + 'json data [ ' + JSON.stringify(data) + ' ]');
                expect(data).assertEqual(1);
                console.log(TAG + '====<end');
                done();
            }).catch((err) => {
                console.log(TAG + ' catch err ====>'
                    + 'json err [ ' + JSON.stringify(err) + ' ]');
                console.log(TAG + '====<end .catch');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.error(TAG + ' delete catch(err)====>' + err);
            console.log(TAG + '====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_DataAbilityAccessDataShare_BatchInsert_0100
    * @tc.name: Insert one or more data records to the database
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_DataAbilityAccessDataShare_BatchInsert_0100', 0, async function (done) {
        TAG = 'ACTS_DataAbilityAccessDataShare_BatchInsert_0100';
        console.log(TAG + '====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        try {
            let vbs = new Array({'name': 'Python', 'introduction': 'Cookbook'},
                {'name': 'JS', 'introduction': 'Guide'}, {'name': 'GO', 'introduction': 'Expert'});
            await DAHelper.batchInsert(
                dataAbilityUri,
                vbs,
                (err, data) => {
                    console.log(TAG +' batchInsert err, data====>'
                        + 'json err [ ' + JSON.stringify(err) + ' ], json data [ ' + JSON.stringify(data) + ' ]');
                    expect(data).assertEqual(3);
                    console.log(TAG +'====<end');
                    done();
                });
        } catch (err) {
            console.error(TAG +' catch(err)====>' + err);
            console.log(TAG +'====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_DataAbilityAccessDataShare_BatchInsert_0200
    * @tc.name: Insert one or more data records to the database
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_DataAbilityAccessDataShare_BatchInsert_0200', 0, async function (done) {
        TAG = 'ACTS_DataAbilityAccessDataShare_BatchInsert_0200';
        console.log(TAG + '====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        try {
            let vbs = new Array({'name': 'Python', 'introduction': 'Cookbook'},
                {'name': 'JS', 'introduction': 'Guide'}, {'name': 'GO', 'introduction': 'Expert'});
            DAHelper.batchInsert(
                dataAbilityUri,
                vbs
            ).then((data) => {
                console.log(TAG + ' then data====>'
                    + 'json data [ ' + JSON.stringify(data) + ' ]');
                expect(data).assertEqual(3);
                console.log(TAG + '====<end');
                done();
            }).catch((err) => {
                console.log(TAG + ' catch err ====>'
                    + 'json err [ ' + JSON.stringify(err) + ' ]');
                console.log(TAG + '====<end .catch');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.error(TAG + ' batchInsert catch(err)====>' + err);
            console.log(TAG + '====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_DataAbilityAccessDataShare_OnOff_0100
    * @tc.name: On/Off : Registers an observer to observe data specified by the given Uri
    * @tc.desc: Check the return value of the interface ()
    */
    it('ACTS_DataAbilityAccessDataShare_OnOff_0100', 0, async function (done) {
        TAG = 'ACTS_DataAbilityAccessDataShare_OnOff_0100';
        console.log(TAG + '====<begin');
        gSetTimeout = 2000;
        try {
            var currentAlertTimeout;
            expect(typeof (DAHelper)).assertEqual("object");
            function onAsyncCallback0100(err) {
                expect(err.code).assertEqual(0);
                DAHelper.off("dataChange", dataAbilityUri, onAsyncCallback0100);
                console.log(TAG + '====<end');
                gSetTimeout = 500;
                done();
            }
            DAHelper.off("dataChange", dataAbilityUri, onAsyncCallback0100);
            DAHelper.on("dataChange", dataAbilityUri, onAsyncCallback0100);

            setTimeout(mySetTimeout, gSetTimeout);
            function mySetTimeout() {
                console.log(TAG + '====< mySetTimeout');
                DAHelper.notifyChange(
                    dataAbilityUri,
                    (err) => {
                        console.log(TAG + ' err=======>'
                            + 'err [ ' + JSON.stringify(err) + ' ]');
                        expect(err.code).assertEqual(0);
                    }
                );
            }
        } catch (err) {
            console.error(TAG + ' catch(err)====>' + err);
            expect(false).assertTrue();
            console.log(TAG + '====<end catch');
            gSetTimeout = 500;
            done();
        }
    })

    /*
    * @tc.number: ACTS_DataAbilityAccessDataShare_OnOff_0200
    * @tc.name: On/Off : Registers an observer to observe data specified by the given Uri
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_DataAbilityAccessDataShare_OnOff_0200', 0, async function (done) {
        TAG = 'ACTS_DataAbilityAccessDataShare_OnOff_0200';
        console.log(TAG + '====<begin');
        gSetTimeout = 2000;
        try {
            var currentAlertTimeout;
            expect(typeof (DAHelper)).assertEqual("object");
            function onAsyncCallback0200(err) {
                console.log(TAG + ' onAsyncCallback0200=======>');
                expect(false).assertTrue();
                clearTimeout(currentAlertTimeout);
                console.log(TAG + '====<end callback_0200');
                done();
            }
            DAHelper.on("dataChange", dataAbilityUri, onAsyncCallback0200);
            DAHelper.off("dataChange", dataAbilityUri, onAsyncCallback0200);

            setTimeout(mySetTimeout, gSetTimeout);
            function mySetTimeout() {
                DAHelper.notifyChange(
                    dataAbilityUri,
                    (err) => {
                        if (err.code != 0) {
                            console.log(TAG + ' err=======>'
                                + 'err [ ' + JSON.stringify(err) + ' ]');
                            expect(false).assertTrue();
                            console.log(TAG + '====<end err.code');
                            done();
                        } else {
                            currentAlertTimeout = setTimeout(() => {
                                expect(err.code).assertEqual(0);
                                console.log(TAG + '====<end');
                                done();
                            }, gSetTimeout);
                        }
                    }
                );
            }
        } catch (err) {
            console.error(TAG + ' catch(err)====>' + err);
            expect(false).assertTrue();
            console.log(TAG + '====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_DataAbilityAccessDataShare_GetType_0100
    * @tc.name: Obtains the MIME type matching the data specified by the URI of the Data ability.
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_DataAbilityAccessDataShare_GetType_0100', 0, async function (done) {
        TAG = 'ACTS_DataAbilityAccessDataShare_GetType_0100';
        console.log(TAG + '====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        try {
            let mimeType = "image";
            await DAHelper.getType(
                dataAbilityUri,
                (err, data) => {
                    console.debug(TAG + ' getType err,data=======>'
                        + 'json err [ ' + JSON.stringify(err) + ' ], json data [ ' + JSON.stringify(data) + ' ]');
                    expect(data).assertEqual(mimeType);
                    console.log(TAG + '====<end');
                    done();
                },
            );
        } catch (err) {
            console.error(TAG + ' getType AsyncCallback catch(err)====>' + err);
            console.log(TAG + '====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_DataAbilityAccessDataShare_GetType_0200
    * @tc.name: Obtains the MIME type matching the data specified by the URI of the Data ability.
    * @tc.desc: Check the return value of the interface (by promise)
    */
    it('ACTS_DataAbilityAccessDataShare_GetType_0200', 0, async function (done) {
        TAG = 'ACTS_DataAbilityAccessDataShare_GetType_0200';
        console.log(TAG + '====<begin');
        try {
            let mimeType = "image";
            var promise = DAHelper.getType(
                dataAbilityUri,
            ).then(data => {
                console.log(TAG + ' then data====>'
                    + 'json data [ ' + JSON.stringify(data) + ' ]');
                expect(data).assertEqual(mimeType);
                console.log(TAG + '====<end');
                done();
            }).catch(err => {
                console.log(TAG + ' catch err ====>'
                    + 'json err [ ' + JSON.stringify(err) + ' ]');
                console.log(TAG + '====<end .catch');
                expect(false).assertTrue();
                done();
            });
            console.log(TAG + ' getType promise ====>' + promise)
        } catch (err) {
            console.error(TAG + ' getType AsyncCallback catch(err)====>' + err);
            console.log(TAG + '====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_DataAbilityAccessDataShare_GetFileTypes_0100
    * @tc.name: Obtains the MIME type of files.
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */

    it('ACTS_DataAbilityAccessDataShare_GetFileTypes_0100', 0, async function (done) {
        TAG = 'ACTS_DataAbilityAccessDataShare_GetFileTypes_0100';
        console.log(TAG + '====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        let mimeTypeFilter = 'image/*';
        try {
            await DAHelper.getFileTypes(
                dataAbilityUri,
                mimeTypeFilter,
                (err, data) => {
                    console.log(TAG + ' getFileTypes err,data=======>'
                        + 'json err [ ' + JSON.stringify(err) + ' ], json data [ ' + JSON.stringify(data) + ' ]');
                    console.log(TAG + ' data.length ====>' + data.length);
                    expect(data.length).assertEqual(3);
                    for (let i = 0; i < data.length; i++) {
                        expect(typeof (data[i])).assertEqual("string");
                        console.log(TAG + ' for data ====>' + err.code +
                            ' data[' + i + ']: ' + data[i]);
                        if (i == 0) {
                            expect(data[i]).assertEqual("type01");
                        } else if (i == 1) {
                            expect(data[i]).assertEqual("type00");
                        } else if (i == 2) {
                            expect(data[i]).assertEqual("type03");
                        }
                    }
                    console.log(TAG + '====<end');
                    done();
                },
            );
        } catch (err) {
            console.error(TAG + ' getFileTypes AsyncCallback catch(err)====>' + err);
            console.log(TAG + '====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

   /*
    * @tc.number: ACTS_DataAbilityAccessDataShare_GetFileTypes_0200
    * @tc.name: Obtains the MIME type of files.
    * @tc.desc: Check the return value of the interface (by promise)
    */

    it('ACTS_DataAbilityAccessDataShare_GetFileTypes_0200', 0, async function (done) {
        TAG = 'ACTS_DataAbilityAccessDataShare_GetFileTypes_0200';
        console.log(TAG + '====<begin');
        let mimeTypeFilter = 'image/*';
        try {
            var promise = DAHelper.getFileTypes(
                dataAbilityUri,
                mimeTypeFilter,
            ).then((data) => {
                console.log(TAG + ' then data====>'
                    + 'json data [ ' + JSON.stringify(data) + ' ]');
                console.log(TAG + ' getFileTypes data.length ====>' + data.length);
                expect(data.length).assertEqual(3);
                for (var i = 0; i < data.length; i++) {
                    expect(typeof (data[i])).assertEqual("string");
                    console.log(TAG + ' for data[' + i + '] ====>' + data[i])
                    if (i == 0) {
                        expect(data[i]).assertEqual("type01");
                    } else if (i == 1) {
                        expect(data[i]).assertEqual("type00");
                    } else if (i == 2) {
                        expect(data[i]).assertEqual("type03");
                    }
                }
                console.log(TAG + '====<end');
                done();
            }).catch(err => {
                console.log(TAG + ' getFileTypes catch err ====>'
                    + 'json err [ ' + JSON.stringify(err) + ' ]');
                console.log(TAG + '====<end .catch');
                expect(false).assertTrue();
                done();
            });
            console.log(TAG + ' getFileTypes promise ====>: ' + promise)
        } catch (err) {
            console.error(TAG + ' getFileTypes AsyncCallback catch(err)====>' + err);
            console.log(TAG + '====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
   * @tc.number: ACTS_DataAbilityAccessDataShare_NormalizeUri_0100
   * @tc.name: Converts the given uri that refer to the Data ability into a normalized URI.
   * @tc.desc: Check the return value of the interface (by AsyncCallback)
   */
    it('ACTS_DataAbilityAccessDataShare_NormalizeUri_0100', 0, async function (done) {
        TAG = 'ACTS_DataAbilityAccessDataShare_NormalizeUri_0100';
        console.log(TAG + '====<begin');
        let ret = false;
        expect(typeof (DAHelper)).assertEqual("object");
        try {
            DAHelper.normalizeUri(
                dataAbilityUri,
                (err, data) => {
                    console.log(TAG + ' err,data=======>'
                         + 'json err [ ' + JSON.stringify(err) + ' ], json data [ ' + JSON.stringify(data) + ' ]');
                    expect(typeof (data)).assertEqual("string");
                    expect(data).assertEqual(dataShareUri);
                    console.log(TAG + '====<end');
                    done();
                },
            );
        } catch (err) {
            console.error(TAG + ' normalizeUri AsyncCallback catch(err)====>' + err);
            console.log(TAG + '====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_DataAbilityAccessDataShare_NormalizeUri_0200
    * @tc.name: Converts the given uri that refer to the Data ability into a normalized URI.
    * @tc.desc: Check the return value of the interface (by promise)
    */
    it('ACTS_DataAbilityAccessDataShare_NormalizeUri_0200', 0, async function (done) {
        TAG = 'ACTS_DataAbilityAccessDataShare_NormalizeUri_0200';
        console.log(TAG + '====<begin');
        let ret = false;
        expect(typeof (DAHelper)).assertEqual("object");
        try {
            DAHelper.normalizeUri(
                dataAbilityUri,
            ).then((data) => {
                console.log(TAG + ' then data====>'
                    + 'json data [ ' + JSON.stringify(data) + ' ]');
                expect(data).assertEqual(dataShareUri);
                console.log(TAG + '====<end');
                done();
            }).catch(err => {
                console.log(TAG + ' catch err ====>'
                    + 'json err [ ' + JSON.stringify(err) + ' ]');
                console.log(TAG + '====<end .catch');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.error(TAG + ' normalizeUri promise catch(err)====>' + err);
            console.log(TAG + '====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_DataAbilityAccessDataShare_DenormalizeUri_0100
    * @tc.name: Converts the given normalized uri generated by normalizeUri into a denormalized one.
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_DataAbilityAccessDataShare_DenormalizeUri_0100', 0, async function (done) {
        TAG = 'ACTS_DataAbilityAccessDataShare_DenormalizeUri_0100';
        console.log(TAG + '====<begin');
        let ret = false;
        expect(typeof (DAHelper)).assertEqual("object");
        try {
            DAHelper.denormalizeUri(
                dataAbilityUri,
                (err, data) => {
                    console.log(TAG + ' err,data=======>'
                         + 'json err [ ' + JSON.stringify(err) + ' ], json data [ ' + JSON.stringify(data) + ' ]');
                    expect(data).assertEqual(dataShareUri);
                    console.log(TAG + '====<end');
                    done();
                },
            );
        } catch (err) {
            console.error(TAG +' denormalizeUri AsyncCallback catch(err)====>' + err);
            console.log(TAG + '====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_DataAbilityAccessDataShare_DenormalizeUri_0200
    * @tc.name: Converts the given normalized uri generated by normalizeUri into a denormalized one.
    * @tc.desc: Check the return value of the interface (by promise)
    */
    it('ACTS_DataAbilityAccessDataShare_DenormalizeUri_0200', 0, async function (done) {
        TAG = 'ACTS_DataAbilityAccessDataShare_DenormalizeUri_0200';
        console.log(TAG + '====<begin');
        let ret = false;
        expect(typeof (DAHelper)).assertEqual("object");
        try {
            DAHelper.denormalizeUri(
                dataAbilityUri,
            ).then((data) => {
                console.log(TAG +' then data====>'
                    + 'json data [ ' + JSON.stringify(data) + ' ]');
                expect(data).assertEqual(dataShareUri);
                console.log(TAG +'====<end');
                done();
            }).catch(err => {
                console.log(TAG +' catch err ====>'
                    + 'json err [ ' + JSON.stringify(err) + ' ]');
                console.log(TAG +'====<end .catch');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.error(TAG +' denormalizeUri promise catch(err)====>' + err);
            console.log(TAG +'====<end catch');
            expect(false).assertTrue();
            done();
        }
    })
})}
