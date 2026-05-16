/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, Hypium } from "../../../hypium/index";
import Context from "application.Context"
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { BusinessError } from "@kit.BasicServicesKit";
import Utils from './Util.test';

let TAG: string = ' PhotoAccessHelperNoPermission: ';
export default function photoAccessHelperNoPermissionStaticTest() {
    describe("photoAccessHelperNoPermissionStaticTest", (): void => {

        /**
         * @tc.name   SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_GETASSETS_STATIC_0100
         * @tc.number SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_GETASSETS_STATIC_0100
         * @tc.desc   photoAccessHelper-getAssets(promise) with no permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_GETASSETS_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
            const testName:string = 'SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_GETASSETS_STATIC_0100 ';
            console.info(TAG, testName + 'begin');
            try {
                let context: Context = Hypium.get("Context") as Context;
                let helper: photoAccessHelper.PhotoAccessHelper|null = photoAccessHelper.getPhotoAccessHelper(context);
                let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
                let fetchOptions: photoAccessHelper.FetchOptions = {
                    fetchColumns: ['date_added', 'date_modified', 'size'],
                    predicates: predicates
                };
                console.info(TAG, testName + 'fetchOptions:' + fetchOptions);
                await helper!.getAssets(fetchOptions);
                expect().assertFail();

                 done();
            } catch (err) {
                console.error(TAG, testName + 'failed. code:' + err.code + ' message:' + err.message);
                expect(err.code).assertEqual(201);
                done();
            }
        })

        /**
         * @tc.name   SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_GETASSETS_STATIC_0200
         * @tc.number SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_GETASSETS_STATIC_0200
         * @tc.desc   photoAccessHelper-getAssets(callback) with no permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_GETASSETS_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const testName:string = 'SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_GETASSETS_STATIC_0200 ';
                console.info(TAG, testName + 'begin');
                try {
                    let context: Context = Hypium.get("Context") as Context;
                    let helper: photoAccessHelper.PhotoAccessHelper|null = photoAccessHelper.getPhotoAccessHelper(context);
                    let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
                    let fetchOptions: photoAccessHelper.FetchOptions = {
                        fetchColumns: ['date_added', 'date_modified', 'size'],
                        predicates: predicates
                    };
                    console.info(TAG, testName + 'fetchOptions:' + fetchOptions);
                    let trigger = false;
                    helper!.getAssets(fetchOptions, (err: BusinessError<void> | null,
                        fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> | undefined) => {
                        console.info(TAG, testName + 'getAssets failed. fetchResult:' + fetchResult + ' code:' + err?.code);
                        expect(err?.code).assertEqual(201);
                        trigger = true;
                        done();
                    });
                    for (let i = 0; i < 10; i++) {
                        if (trigger) {
                            break;
                        }
                        await Utils.msSleep(100);
                    }
                    expect(trigger).assertTrue();
                    done();
                } catch (err) {
                    console.error(TAG, testName + 'failed. code:' + err.code + ' message:' + err.message);
                    expect().assertFail();
                    done();
                }
            })

        /**
         * @tc.name   SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_GETBURSTASSETS_STATIC_0100
         * @tc.number SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_GETBURSTASSETS_STATIC_0100
         * @tc.desc   photoAccessHelper-getBurstAssets(promise) with no permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_GETBURSTASSETS_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const testName:string = 'SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_GETBURSTASSETS_STATIC_0100 ';
                console.info(TAG, testName + 'begin');
                try {
                    let context: Context = Hypium.get("Context") as Context;
                    let helper: photoAccessHelper.PhotoAccessHelper|null = photoAccessHelper.getPhotoAccessHelper(context);
                    let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
                    let fetchOptions: photoAccessHelper.FetchOptions = {
                        fetchColumns: ['date_added', 'date_modified', 'size'],
                        predicates: predicates
                    };
                    let burstKey = "e719d696-09fa-44f8-ec3f215aa62a";
                    await helper!.getBurstAssets(burstKey, fetchOptions);
                    expect().assertFail();
                    done();
                } catch (err) {
                    console.error(TAG, testName + 'failed. code:' + err.code + ' message:' + err.message);
                    expect(err.code).assertEqual(201);
                    done();
                }
            })

        /**
         * @tc.name   SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_CREATEASSET_STATIC_0100
         * @tc.number SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_CREATEASSET_STATIC_0100
         * @tc.desc   photoAccessHelper-createAsset(promise) with no permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_CREATEASSET_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const testName:string = 'SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_CREATEASSET_STATIC_0100 ';
                console.info(TAG, testName + 'begin');
                try {
                    let context: Context = Hypium.get("Context") as Context;
                    let helper: photoAccessHelper.PhotoAccessHelper|null = photoAccessHelper.getPhotoAccessHelper(context);
                    const extension = 'jpg';
                    await helper!.createAsset(photoAccessHelper.PhotoType.IMAGE, extension);
                    expect().assertFail();
                    done();
                } catch (err) {
                    console.error(TAG, testName + 'failed. code:' + err.code + ' message:' + err.message);
                    expect(err.code).assertEqual(201);
                    done();
                }
            })

        /**
         * @tc.name   SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_CREATEASSET_STATIC_0200
         * @tc.number SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_CREATEASSET_STATIC_0200
         * @tc.desc   photoAccessHelper-createAsset(callback) with no permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_CREATEASSET_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const testName:string = 'SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_CREATEASSET_STATIC_0200 ';
                console.info(TAG, testName + 'begin');
                try {
                    let context: Context = Hypium.get("Context") as Context;
                    let helper: photoAccessHelper.PhotoAccessHelper|null = photoAccessHelper.getPhotoAccessHelper(context);
                    const extension = 'jpg';
                    let trigger = false;
                    helper!.createAsset(photoAccessHelper.PhotoType.IMAGE, extension, (err: BusinessError<void> | null, uri: string | undefined): void => {
                        console.info(TAG, testName + 'getAssets failed. uri:' + uri + ' code:' + err?.code);
                        expect(err?.code).assertEqual(201);
                        trigger = true;
                        done();
                    });
                    for (let i = 0; i < 10; i++) {
                        if (trigger) {
                            break;
                        }
                        await Utils.msSleep(100);
                    }
                    expect(trigger).assertTrue();
                    done();
                } catch (err) {
                    console.error(TAG, testName + 'failed. code:' + err.code + ' message:' + err.message);
                    expect().assertFail();
                    done();
                }
            })

        /**
         * @tc.name   SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_CREATEASSET_STATIC_0300
         * @tc.number SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_CREATEASSET_STATIC_0300
         * @tc.desc   photoAccessHelper-createAsset(callback) with no permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_CREATEASSET_STATIC_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const testName:string = 'SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_CREATEASSET_STATIC_0300 ';
                console.info(TAG, testName + 'begin');
                try {
                    let context: Context = Hypium.get("Context") as Context;
                    let helper: photoAccessHelper.PhotoAccessHelper|null = photoAccessHelper.getPhotoAccessHelper(context);
                    const extension = 'jpg';
                    let options: photoAccessHelper.CreateOptions = {
                        title: undefined
                    }
                    let trigger = false;
                    helper!.createAsset(photoAccessHelper.PhotoType.IMAGE, extension, options, (
                      err: BusinessError<void> | null, uri: string | undefined): void => {
                        console.info(TAG, testName + 'getAssets failed. uri:' + uri + ' code:' + err?.code);
                        expect(err?.code).assertEqual(201);
                        trigger = true;
                        done();
                    });
                    for (let i = 0; i < 10; i++) {
                        if (trigger) {
                            break;
                        }
                        await Utils.msSleep(100);
                    }
                    expect(trigger).assertTrue();
                    done();
                } catch (err) {
                    console.error(TAG, testName + 'failed. code:' + err.code + ' message:' + err.message);
                    expect().assertFail();
                    done();
                }
            })

        /**
         * @tc.name   SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_CREATEPHOTOASSET_STATIC_0100
         * @tc.number SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_CREATEPHOTOASSET_STATIC_0100
         * @tc.desc   photoAccessHelper-createPhotoAsset(promise) with no permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_CREATEPHOTOASSET_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
            const testName:string = 'SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_CREATEPHOTOASSET_STATIC_0100 ';
            console.info(TAG, testName + 'begin');
            const type: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
            const extension = 'jpg';
            const title = 'createPhotoAsset' + new Date().getTime();
            try {
                let context: Context = Hypium.get("Context") as Context;
                let helper: photoAccessHelper.PhotoAccessHelper|null = photoAccessHelper.getPhotoAccessHelper(context);
                let uri = await helper!.createPhotoAsset(type, extension, title);
                console.info(TAG, testName + `createPhotoAsset success; uri: ${uri}`);
                expect().assertFail();
                done();
            } catch (err) {
                console.error(TAG, testName + 'failed. code:' + err.code + ' message:' + err.message);
                expect(err.code).assertEqual(201);
                done();
            }
        })

        /**
         * @tc.name   SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_GETALBUMS_STATIC_0100
         * @tc.number SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_GETALBUMS_STATIC_0100
         * @tc.desc   photoAccessHelper-getAlbums(promise) with no permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_GETALBUMS_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const testName:string = 'SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_GETALBUMS_STATIC_0100 ';
                console.info(TAG, testName + 'begin');
                try {
                    let context: Context = Hypium.get("Context") as Context;
                    let helper: photoAccessHelper.PhotoAccessHelper|null = photoAccessHelper.getPhotoAccessHelper(context);
                    await helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
                    expect().assertFail();
                    done();
                } catch (err) {
                    console.error(TAG, testName + 'failed. code:' + err.code + ' message:' + err.message);
                    expect(err.code).assertEqual(201);
                    done();
                }
            })

        /**
         * @tc.name   SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_GETALBUMS_STATIC_0200
         * @tc.number SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_GETALBUMS_STATIC_0200
         * @tc.desc   photoAccessHelper-getAlbums(callback) with no permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_GETALBUMS_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const testName:string = 'SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_GETALBUMS_STATIC_0200 ';
                console.info(TAG, testName + 'begin');
                try {
                    let context: Context = Hypium.get("Context") as Context;
                    let helper: photoAccessHelper.PhotoAccessHelper|null = photoAccessHelper.getPhotoAccessHelper(context);
                    let trigger = false;
                    helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC, (
                        err: BusinessError<void> | null, result: photoAccessHelper.FetchResult<photoAccessHelper.Album>|undefined): void => {
                        console.info(TAG, testName + 'getAssets failed. result:' + result + ' code:' + err?.code);
                        expect(err?.code).assertEqual(201);
                        trigger = true;
                        done();
                    });
                    for (let i = 0; i < 10; i++) {
                        if (trigger) {
                            break;
                        }
                        await Utils.msSleep(100);
                    }
                    expect(trigger).assertTrue();
                    done();
                } catch (err) {
                    console.error(TAG, testName + 'failed. code:' + err.code + ' message:' + err.message);
                    expect().assertFail();
                    done();
                }
            })

        /**
         * @tc.name   SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_GETALBUMS_STATIC_0300
         * @tc.number SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_GETALBUMS_STATIC_0300
         * @tc.desc   photoAccessHelper-getAlbums(callback) with no permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_GETALBUMS_STATIC_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const testName:string = 'SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_GETALBUMS_STATIC_0300 ';
                console.info(TAG, testName + 'begin');
                try {
                    let context: Context = Hypium.get("Context") as Context;
                    let helper: photoAccessHelper.PhotoAccessHelper|null = photoAccessHelper.getPhotoAccessHelper(context);
                    let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
                    let fetchOptions: photoAccessHelper.FetchOptions = {
                        fetchColumns: ['date_added', 'date_modified', 'size'],
                        predicates: predicates
                    };
                    let trigger = false;
                    helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC,
                        fetchOptions, (err: BusinessError<void> | null, result: photoAccessHelper.FetchResult<photoAccessHelper.Album>|undefined): void => {
                            console.info(TAG, testName + 'getAssets failed. result:' + result + ' code:' + err?.code);
                            expect(err?.code).assertEqual(201);
                            trigger = true;
                            done();
                        });
                    for (let i = 0; i < 10; i++) {
                        if (trigger) {
                            break;
                        }
                        await Utils.msSleep(100);
                    }
                    expect(trigger).assertTrue();
                    done();
                } catch (err) {
                    console.error(TAG, testName + 'failed. code:' + err.code + ' message:' + err.message);
                    expect().assertFail();
                    done();
                }
            })

        /**
         * @tc.name   SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_APPLYCHANGES_STATIC_0100
         * @tc.number SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_APPLYCHANGES_STATIC_0100
         * @tc.desc   photoAccessHelper-applyChanges(promise) with no permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_APPLYCHANGES_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const testName:string = 'SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_APPLYCHANGES_STATIC_0100';
                console.info(TAG, testName + 'begin');
                try {
                    let context: Context = Hypium.get("Context") as Context;
                    let helper: photoAccessHelper.PhotoAccessHelper|null = photoAccessHelper.getPhotoAccessHelper(context);
                    let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
                    let extension: string = 'jpg';
                    let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest | null =
                        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(context, photoType, extension);
                    assetChangeRequest!.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, new ArrayBuffer(1024));
                    await helper!.applyChanges(assetChangeRequest!);
                    expect().assertFail();
                    done();
                } catch (err) {
                    console.error(TAG, testName + 'failed. code:' + err.code + ' message:' + err.message);
                    expect(err.code).assertEqual(201);
                    done();
                }
            })

        /**
         * @tc.name   SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_ONPHOTOCHANGE_STATIC_0100
         * @tc.number SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_ONPHOTOCHANGE_STATIC_0100
         * @tc.desc   photoAccessHelper-onPhotoChange(callback) with no permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_ONPHOTOCHANGE_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const testName:string = 'SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_ONPHOTOCHANGE_STATIC_0100 ';
                console.info(TAG, testName + 'begin');
                try {
                    let context: Context = Hypium.get("Context") as Context;
                    let helper: photoAccessHelper.PhotoAccessHelper|null = photoAccessHelper.getPhotoAccessHelper(context);
                    helper!.onPhotoChange((changeData: photoAccessHelper.PhotoAssetChangeInfos) => {
                        console.info(TAG, testName + ` changeData: ${JSON.stringify(changeData)}`);
                        expect().assertFail();
                    });
                    expect().assertFail();
                    done();
                } catch (err) {
                    console.error(TAG, testName + 'failed. code:' + err.code + ' message:' + err.message);
                    expect(err.code).assertEqual(201);
                    done();
                }
            })

        /**
         * @tc.name   SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_OFFPHOTOCHANGE_STATIC_0100
         * @tc.number SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_OFFPHOTOCHANGE_STATIC_0100
         * @tc.desc   photoAccessHelper-offPhotoChange(callback) with no permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_OFFPHOTOCHANGE_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const testName:string = 'SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_OFFPHOTOCHANGE_STATIC_0100 ';
                console.info(TAG, testName + 'begin');
                try {
                    let context: Context = Hypium.get("Context") as Context;
                    let helper: photoAccessHelper.PhotoAccessHelper|null = photoAccessHelper.getPhotoAccessHelper(context);
                    helper!.offPhotoChange((changeData: photoAccessHelper.PhotoAssetChangeInfos) => {
                        console.info(TAG, testName + ` changeData: ${JSON.stringify(changeData)}`);
                        expect().assertFail();
                    });
                    expect().assertFail();
                    done();
                } catch (err) {
                    console.error(TAG, testName + 'failed. code:' + err.code + ' message:' + err.message);
                    //与动态保持一致，未调用on时先抛出23800151
                    expect(err.code).assertEqual(23800151);
                    done();
                }
            })

        /**
         * @tc.name   SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_ONPHOTOALBUMCHANGE_STATIC_0100
         * @tc.number SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_ONPHOTOALBUMCHANGE_STATIC_0100
         * @tc.desc   photoAccessHelper-onPhotoAlbumChange(callback) with no permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_ONPHOTOALBUMCHANGE_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const testName:string = 'SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_ONPHOTOALBUMCHANGE_STATIC_0100 ';
                console.info(TAG, testName + 'begin');
                try {
                    let context: Context = Hypium.get("Context") as Context;
                    let helper: photoAccessHelper.PhotoAccessHelper|null = photoAccessHelper.getPhotoAccessHelper(context);
                    helper!.onPhotoAlbumChange((changeData: photoAccessHelper.AlbumChangeInfos) => {
                        console.info(TAG, testName + ` changeData: ${JSON.stringify(changeData)}`);
                        expect().assertFail();
                    });
                    expect().assertFail();
                    done();
                } catch (err) {
                    console.error(TAG, testName + 'failed. code:' + err.code + ' message:' + err.message);
                    expect(err.code).assertEqual(201);
                    done();
                }
            })

        /**
         * @tc.name   SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_OFFPHOTOALBUMCHANGE_STATIC_0100
         * @tc.number SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_OFFPHOTOALBUMCHANGE_STATIC_0100
         * @tc.desc   photoAccessHelper-offPhotoAlbumChange(callback) with no permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_OFFPHOTOALBUMCHANGE_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const testName:string = 'SUB_MUTIMEDIA_PHOTOACCESS_PHOTOACCESSHELPER_OFFPHOTOALBUMCHANGE_STATIC_0100 ';
                console.info(TAG, testName + 'begin');
                try {
                    let context: Context = Hypium.get("Context") as Context;
                    let helper: photoAccessHelper.PhotoAccessHelper|null = photoAccessHelper.getPhotoAccessHelper(context);
                    helper!.offPhotoAlbumChange((changeData: photoAccessHelper.AlbumChangeInfos) => {
                        console.info(TAG, testName + ` changeData: ${JSON.stringify(changeData)}`);
                        expect().assertFail();
                    });
                    expect().assertFail();
                    done();
                } catch (err) {
                    console.error(TAG, testName + 'failed. code:' + err.code + ' message:' + err.message);
                    //与动态保持一致，未调用on时先抛出23800151
                    expect(err.code).assertEqual(23800151);
                    done();
                }
            })

        /**
         * @tc.name   SUB_MUTIMEDIA_PHOTOACCESS_MEDIAASSETMANAGER_CANCELREQUEST_STATIC_0100
         * @tc.number SUB_MUTIMEDIA_PHOTOACCESS_MEDIAASSETMANAGER_CANCELREQUEST_STATIC_0100
         * @tc.desc   mediaAssetManager-cancelRequest(promise) with no permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MUTIMEDIA_PHOTOACCESS_MEDIAASSETMANAGER_CANCELREQUEST_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const testName:string = 'SUB_MUTIMEDIA_PHOTOACCESS_MEDIAASSETMANAGER_CANCELREQUEST_STATIC_0100 ';
                console.info(TAG, testName + 'begin');
                try {
                    let context: Context = Hypium.get("Context") as Context;
                    let requestId: string = '123123';
                    await photoAccessHelper.MediaAssetManager.cancelRequest(context, requestId);
                    done();
                } catch (err) {
                    console.error(TAG, testName + 'failed. code:' + err.code + ' message:' + err.message);
                    //与动态保持一致，无权限场景不抛错误码
                    expect().assertFail();
                    done();
                }
            })

        /**
         * @tc.name   SUB_MUTIMEDIA_PHOTOACCESS_MEDIAASSETCHANGEREQUEST_GETWRITECACHEHANDLER_STATIC_0100
         * @tc.number SUB_MUTIMEDIA_PHOTOACCESS_MEDIAASSETCHANGEREQUEST_GETWRITECACHEHANDLER_STATIC_0100
         * @tc.desc   mediaAssetChangeRequest-getWriteCacheHandler(promise) with no permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MUTIMEDIA_PHOTOACCESS_MEDIAASSETCHANGEREQUEST_GETWRITECACHEHANDLER_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const testName:string = 'SUB_MUTIMEDIA_PHOTOACCESS_MEDIAASSETCHANGEREQUEST_GETWRITECACHEHANDLER_STATIC_0100 ';
                console.info(TAG, testName + 'begin');
                try {
                    let context: Context = Hypium.get("Context") as Context;
                    let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest|null =
                        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(context, photoAccessHelper.PhotoType.IMAGE, 'jpg');
                    await assetChangeRequest!.getWriteCacheHandler()
                    expect().assertFail();
                    done();
                } catch (err) {
                    console.error(TAG, testName + 'failed. code:' + err.code + ' message:' + err.message);
                    expect(err.code).assertEqual(14000011);
                    done();
                }
            })




    })
}