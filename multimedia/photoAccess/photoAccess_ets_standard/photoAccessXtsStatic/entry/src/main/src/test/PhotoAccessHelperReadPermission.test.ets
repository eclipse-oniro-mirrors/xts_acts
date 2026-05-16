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

import { describe, it, expect, TestType, Size, Level, Hypium, beforeAll } from "../../../hypium/index";
import Context from "application.Context"
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import abilityAccessCtrl, { PermissionRequestResult } from '@ohos.abilityAccessCtrl';
import { Permissions } from 'permissions';
import { BusinessError } from '@ohos.base';
import { Driver, MatchPattern, ON } from '@ohos.UiTest';


let TAG: string = 'PhotoAccessHelperReadPermission:';
export default function photoAccessHelperReadPermissionStaticTest() {
    describe("photoAccessHelperReadPermissionStaticTest", (): void => {
        let sleep = (ms: int) =>  {
            return new Promise<int>((resolve) => {
                setTimeout(() => {
                    resolve(0);
                }, ms);
            });
        }

        beforeAll(async () => {
            console.info(TAG, 'PhotoAccessHelperReadPermissionStaticTest begin');
            try {
                await sleep(2000);
                console.info(TAG, 'getReadPermission start');
                let atManager = abilityAccessCtrl.createAtManager();
                let testContext: Context = Hypium.get("context") as Context;
                let arr: Array<Permissions> = new Array<Permissions>();
                arr.push('ohos.permission.READ_IMAGEVIDEO');
                atManager.requestPermissionsFromUser(testContext, arr,
                    (err: BusinessError | null, data: PermissionRequestResult | undefined) => {
                    if (err?.code !== 0) {
                        console.info(TAG, 'err.code: ' + err?.code + ', err.message: '+ err?.message);
                    } else {
                        console.info(TAG, 'requestPermissionsFromUser data:' + data + ' permissions:' + data?.permissions +
                            ' authResults:' + data?.authResults + ' dialogShownResults:' + data?.dialogShownResults);
                    }
                });
                await sleep(2000);
                let dr = Driver.create();
                let power1 = await dr.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 500);
                let power2 = await dr.waitForComponent(ON.text('始终允许', MatchPattern.EQUALS), 500);
                await power1?.click();
                await power2?.click();
            } catch (error) {
                console.info(TAG, 'getPermission failed. err.code: ' + error?.code + ', err.message: '+ error?.message);
            }
            await sleep(1000);
        });

        /**
         * @tc.name   SUB_MUTIMEDIA_PHOTOACCESS_PHOTOASSET_CLONE_STATIC_0100
         * @tc.number SUB_MUTIMEDIA_PHOTOACCESS_PHOTOASSET_CLONE_STATIC_0100
         * @tc.desc   PhotoAsset-clone invoke with readPermission only
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MUTIMEDIA_PHOTOACCESS_PHOTOASSET_CLONE_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const testName:string = 'SUB_MUTIMEDIA_PHOTOACCESS_PHOTOASSET_CLONE_STATIC_0100 ';
                console.info(TAG, testName + 'begin');
                let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
                let fetchOptions: photoAccessHelper.FetchOptions = {
                    fetchColumns: ['date_added', 'date_modified', 'size'],
                    predicates: predicates
                };
                try {
                    let context: Context = Hypium.get("Context") as Context;
                    let helper: photoAccessHelper.PhotoAccessHelper|null = photoAccessHelper.getPhotoAccessHelper(context);
                    let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset>;
                    fetchResult = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOptions);
                    let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
                    console.info(TAG, 'PhotoAsset_commitModify_ReadPermission_static_002 commitModify begin');
                    let title: string = "PhotoAsset_clone_ReadPermission_static_001";
                    asset.clone(title);
                    expect().assertFail();
                    done();
                } catch (err) {
                    console.error(TAG, testName + 'failed. code:' + err.code + ' message:' + err.message);
                    expect(err.code).assertEqual(201);
                    done();
                }
            })


        /**
         * @tc.name   SUB_MUTIMEDIA_PHOTOACCESS_PHOTOASSET_COMMITMODIFY_STATIC_0100
         * @tc.number SUB_MUTIMEDIA_PHOTOACCESS_PHOTOASSET_COMMITMODIFY_STATIC_0100
         * @tc.desc   PhotoAsset-commitModify invoke with readPermission only
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MUTIMEDIA_PHOTOACCESS_PHOTOASSET_COMMITMODIFY_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const testName:string = 'SUB_MUTIMEDIA_PHOTOACCESS_PHOTOASSET_COMMITMODIFY_STATIC_0100 ';
                console.info(TAG, testName + 'begin');
                let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
                let fetchOptions: photoAccessHelper.FetchOptions = {
                    fetchColumns: ['date_added', 'date_modified', 'size'],
                    predicates: predicates
                };
                try {
                    let context: Context = Hypium.get("Context") as Context;
                    let helper: photoAccessHelper.PhotoAccessHelper|null = photoAccessHelper.getPhotoAccessHelper(context);
                    let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset>;
                    fetchResult = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOptions);
                    let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
                    console.info(TAG, testName + 'commitModify begin');
                    asset.commitModify();
                    expect().assertFail();
                    done();
                } catch (err) {
                    console.error(TAG, testName + 'failed. code:' + err.code + ' message:' + err.message);
                    expect(err.code).assertEqual(201);
                    done();
                }
            })

        /**
         * @tc.name   SUB_MUTIMEDIA_PHOTOACCESS_PHOTOASSET_COMMITMODIFY_STATIC_0200
         * @tc.number SUB_MUTIMEDIA_PHOTOACCESS_PHOTOASSET_COMMITMODIFY_STATIC_0200
         * @tc.desc   PhotoAsset-commitModify invoke with readPermission only
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MUTIMEDIA_PHOTOACCESS_PHOTOASSET_COMMITMODIFY_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const testName:string = 'SUB_MUTIMEDIA_PHOTOACCESS_PHOTOASSET_COMMITMODIFY_STATIC_0200 ';
                console.info(TAG, testName + 'begin');
                let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
                let fetchOptions: photoAccessHelper.FetchOptions = {
                    fetchColumns: ['date_added', 'date_modified', 'size'],
                    predicates: predicates
                };
                try {
                    let context: Context = Hypium.get("Context") as Context;
                    let helper: photoAccessHelper.PhotoAccessHelper|null = photoAccessHelper.getPhotoAccessHelper(context);
                    let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset>;
                    fetchResult = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOptions);
                    let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
                    console.info(TAG, testName + 'commitModify begin');
                    asset.commitModify((err:BusinessError|null) => {
                        if (err !== null) {
                            console.error(TAG, `commitModify failed with error: ${err!.code}, ${err!.message}`);
                            expect().assertFail();
                        } else {
                            console.info(TAG, 'commitModify successfully');
                        }
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
         * @tc.name   SUB_MUTIMEDIA_PHOTOACCESS_ALBUM_COMMITMODIFY_STATIC_0100
         * @tc.number SUB_MUTIMEDIA_PHOTOACCESS_ALBUM_COMMITMODIFY_STATIC_0100
         * @tc.desc   Album-commitModify invoke with readPermission only
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MUTIMEDIA_PHOTOACCESS_ALBUM_COMMITMODIFY_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const testName:string = 'SUB_MUTIMEDIA_PHOTOACCESS_ALBUM_COMMITMODIFY_STATIC_0100 ';
                console.info(TAG, testName + 'begin');
                try {
                    let context: Context = Hypium.get("Context") as Context;
                    let phAccessHelper: photoAccessHelper.PhotoAccessHelper|null = photoAccessHelper.getPhotoAccessHelper(context);
                    let predicates: dataSharePredicates.DataSharePredicates|null = new dataSharePredicates.DataSharePredicates();
                    let albumFetchOptions: photoAccessHelper.FetchOptions = {
                        fetchColumns: [],
                        predicates: predicates!
                    };
                    let albumList: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await phAccessHelper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC, albumFetchOptions);
                    if (albumList === undefined) {
                        console.error('albumList is undefined');
                        return;
                    }
                    let album: photoAccessHelper.Album = await albumList.getFirstObject();
                    console.info(TAG, testName + 'commitModify begin');
                    album.commitModify();
                    expect().assertFail();
                    done();
                } catch (err) {
                    console.error(TAG, testName + 'failed. code:' + err.code + ' message:' + err.message);
                    expect(err.code).assertEqual(201);
                    done();
                }
            })

        /**
         * @tc.name   SUB_MUTIMEDIA_PHOTOACCESS_ALBUM_COMMITMODIFY_STATIC_0200
         * @tc.number SUB_MUTIMEDIA_PHOTOACCESS_ALBUM_COMMITMODIFY_STATIC_0200
         * @tc.desc   Album-commitModify invoke with readPermission only
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MUTIMEDIA_PHOTOACCESS_ALBUM_COMMITMODIFY_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const testName:string = 'SUB_MUTIMEDIA_PHOTOACCESS_ALBUM_COMMITMODIFY_STATIC_0200 ';
                console.info(TAG, testName + 'begin');
                try {
                    let context: Context = Hypium.get("Context") as Context;
                    let phAccessHelper: photoAccessHelper.PhotoAccessHelper|null = photoAccessHelper.getPhotoAccessHelper(context);
                    let predicates: dataSharePredicates.DataSharePredicates|null = new dataSharePredicates.DataSharePredicates();
                    let albumFetchOptions: photoAccessHelper.FetchOptions = {
                        fetchColumns: [],
                        predicates: predicates!
                    };
                    let albumList: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await phAccessHelper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC, albumFetchOptions);
                    if (albumList === undefined) {
                        console.error('albumList is undefined');
                        return;
                    }
                    let album: photoAccessHelper.Album = await albumList.getFirstObject();
                    console.info(TAG, testName + 'commitModify begin');
                    album.commitModify((err:BusinessError|null) => {
                        if (err !== null) {
                            console.error(TAG, `commitModify failed with error: ${err!.code}, ${err!.message}`);
                            expect().assertFail();
                        } else {
                            console.info(TAG, 'commitModify successfully');
                        }
                    });
                    expect().assertFail();
                    done();
                } catch (err) {
                    console.error(TAG, testName + 'failed. code:' + err.code + ' message:' + err.message);
                    expect(err.code).assertEqual(201);
                    done();
                }
            })
    })
}