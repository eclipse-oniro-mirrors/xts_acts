/**
 * Copyright (c) 2023 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import photoAccessHelper from '@ohos.file.photoAccessHelper';
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import { checkSet,checkUri,checkReadAndWrite,columns,photoExtensions,videoExtensions,sizes,getPhotoAssetAttrs,
    fetchOptions_allocate_file} from './common.ets'
import { BusinessError } from '@ohos.base';
import { getPermission, photoKeys } from '../../../../../../../common'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

export default function PhotoAccessHelperTest() {

    describe('PhotoAccessHelperTest', function () {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOptions: photoAccessHelper.FetchOptions = {
            fetchColumns: [],
            predicates: predicates
        };
        let options: photoAccessHelper.CreateOptions = {
            title: 'testPhoto'
        }
        let fetchResultCount = 0
        const context = globalThis.abilityContext
        const imageType = photoAccessHelper.PhotoType.IMAGE
        const videoType = photoAccessHelper.PhotoType.VIDEO

        function getPhotoHelper(context){
            return photoAccessHelper.getPhotoAccessHelper(context);
        }

        let keyNumCallback = 0
        function getAssetsForKeysCallback(phAccessHelper, fetchOptions, tag, done){
            fetchOptions.fetchColumns = [columns[keyNumCallback]]
            phAccessHelper.getAssets(fetchOptions, async (err, fetchResult) => {
                if (fetchResult != undefined) {
                    let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
                    keyNumCallback++
                    if(keyNumCallback==columns.length-1){
                        keyNumCallback = 0
                        console.info('getAssetsForKeysCallback getAssets end');
                        releaseHelperCallback(phAccessHelper,done)
                    }else{
                        getAssetsForKeysCallback(phAccessHelper, fetchOptions, tag, done)
                    }
                } else {
                    console.error(`getAssetsForKeysCallback ${tag} fetchResult fail ${keyNumCallback}` + err);
                    expect(false).assertTrue();
                    done();
                }
            });
        }

        let keyNumPromise = 0
        async function getAssetsForKeysPromise(phAccessHelper, fetchOptions, done){
            try{
                fetchOptions.fetchColumns = [columns[keyNumPromise]]
                let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
                if (fetchResult != undefined) {
                    let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
                    keyNumPromise++
                    if(keyNumPromise==17){
                        keyNumPromise = 0
                        console.info('getAssetsForKeysPromise getAssets end');
                        releaseHelperPromise(phAccessHelper,done)
                    }else{
                        getAssetsForKeysPromise(phAccessHelper, fetchOptions, done)
                    }
                }
            } catch (err) {
                console.error('getAssets failed, message = ', err);
                expect(false).assertTrue();
                done();
            }
        }

        function getAssetsAndReleaseCallback(phAccessHelper,fetchOptions,done){
            console.info('getAssets start');
            phAccessHelper.getAssets(fetchOptions, async (err, fetchResult) => {
                if (fetchResult != undefined) {
                    console.info('fetchResult success');
                    let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
                    if (photoAsset != undefined) {
                        console.info('photoAsset.displayName : ' + photoAsset.displayName);
                        console.info('photoAsset.uri : ' + photoAsset.uri);
                        console.info('photoAsset.photoType : ' + photoAsset.photoType);
                    }
                    console.info('fetchOptions.fetchColumns : ' + fetchOptions.fetchColumns);
                    console.info('getAssets end');
                    releaseHelperCallback(phAccessHelper,done)
                } else {
                    console.error('fetchResult fail' + err);
                    expect(false).assertTrue();
                    done();
                }
            });
        }

        async function getAssetsAndReleasePromise(phAccessHelper,fetchOptions,done){
            try {
                let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
                if (fetchResult != undefined) {
                    console.info('fetchResult success');
                    let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
                    if (photoAsset != undefined) {
                        console.info('photoAsset.displayName : ' + photoAsset.displayName);
                        console.info('photoAsset.uri : ' + photoAsset.uri);
                        console.info('photoAsset.photoType : ' + photoAsset.photoType);
                    }
                    releaseHelperPromise(phAccessHelper,done)
                }
            } catch (err) {
                console.error('getAssets failed, message = ', err);
                expect(false).assertTrue();
                done();
            }
        }

        function setArgGetAssetsCallback(photoHelper,columns,tag,done){
            try{
                fetchOptions.fetchColumns = columns
                getAssetsAndReleaseCallback(photoHelper,fetchOptions,done)
                console.info(`${tag} excute pass`);
            } catch(err){
                console.error(`${tag} getAssets failed , catch err is ` + err.message);
                expect(false).assertTrue();
                done();
            }
        }

        function setArgGetAssetsPromise(photoHelper,columns,tag,done){
            try{
                fetchOptions.fetchColumns = columns
                getAssetsAndReleasePromise(photoHelper,fetchOptions,done)
                console.info(`${tag} excute pass`);
            } catch(err){
                console.error(`${tag} getAssets failed , catch err is ` + err.message);
                expect(false).assertTrue();
                done();
            }
        }

        function createAsset(phAccessHelper,photoType, extension, options, done) {
            phAccessHelper.createAsset(photoType, extension, options, (err, uri) => {
                if (uri != undefined) {
                    console.info('createAsset uri' + uri);
                    checkUri(uri, photoType, extension)
                    releaseHelperCallback(phAccessHelper,done)
                } else {
                    console.error('createAsset failed, message = ', err);
                    expect(false).assertTrue();
                    done();
                }
            });
        }

        let suffixNum1 = 0
        function createAssetWithSuffixesCallback1(phAccessHelper, photoType, extension, options, extensions, done){
            console.info('createAssetWithSuffixesCallback1 start');
            extension = extensions[suffixNum1]
            console.info(`createAssetWithSuffixesCallback1 set suffix is:` + extension);
            phAccessHelper.createAsset(photoType, extension, options, (err, uri) => {
                if (uri != undefined) {
                    console.info('createAsset uri: ' + uri);
                    checkUri(uri, photoType, extension)
                    suffixNum1++
                    if(suffixNum1==extensions.length){
                        suffixNum1 = 0
                        console.info('createAssetWithSuffixesCallback1 getAssets end');
                        releaseHelperCallback(phAccessHelper,done)
                    }else{
                        createAssetWithSuffixesCallback1(phAccessHelper, photoType, extension, options, extensions, done)
                    }
                } else {
                    console.error('createAsset failed, message = ', err);
                    expect(false).assertTrue();
                    done();
                }
            });
        }

        let suffixNum2 = 0
        function createAssetWithSuffixesCallback2(phAccessHelper, photoType, extension, extensions, done){
            console.info('createAssetWithSuffixesCallback2 start');
            extension = extensions[suffixNum2]
            console.info(`createAssetWithSuffixesCallback2 set suffix is:` + extension);
            phAccessHelper.createAsset(photoType, extension, (err, uri) => {
                if (uri != undefined) {
                    console.info('createAsset uri' + uri);
                    checkUri(uri, photoType, extension)
                    suffixNum2++
                    if(suffixNum2==extensions.length){
                        suffixNum2 = 0
                        console.info('createAssetWithSuffixesCallback2 getAssets end');
                        releaseHelperCallback(phAccessHelper,done)
                    }else{
                        createAssetWithSuffixesCallback2(phAccessHelper, photoType, extension, extensions, done)
                    }
                } else {
                    console.error('createAsset failed, message = ', err);
                    expect(false).assertTrue();
                    done();
                }
            });
        }

        let suffixNum3 = 0
        async function createAssetWithSuffixesPromise(phAccessHelper, photoType, extension, options, extensions, done){
            console.info('createAssetWithSuffixesPromise start');
            extension = extensions[suffixNum3]
            console.info(`createAssetWithSuffixesPromise set suffix is:` + extension);
            try {
                let uri;
                if(options.title == "no"){
                    uri= await phAccessHelper.createAsset(photoType, extension);
                    checkUri(uri, photoType, extension)
                }else {
                    uri= await phAccessHelper.createAsset(photoType, extension, options);
                    checkUri(uri, photoType, extension)
                }
                console.info('createAsset uri' + uri);
                suffixNum3++
                if(suffixNum3==extensions.length){
                    suffixNum3 = 0
                    console.info('createAssetWithSuffixesPromise getAssets end');
                    releaseHelperPromise(phAccessHelper,done)
                }else{
                    createAssetWithSuffixesPromise(phAccessHelper, photoType, extension, options, extensions, done)
                }
            } catch (err) {
                console.error('createAsset failed, message = ', err);
                expect(false).assertTrue();
                done();
            }
        }

        function registerChangeCallback(callBackSet, uriSet, phAccessHelper, forChildUris, done){
            phAccessHelper.getAssets(fetchOptions, async (err, fetchResult) => {
                if (fetchResult != undefined) {
                    console.info('fetchResult success');
                    fetchResult.getFirstObject((err, photoAsset) => {
                        if (photoAsset != undefined) {
                            console.info('photoAsset displayName: ', photoAsset.displayName);
                            let onCallback1 = (changeData: photoAccessHelper.ChangeData) => {
                                console.info('onCallback1 success, changData: ' + JSON.stringify(changeData));
                            }
                            checkSet(callBackSet, uriSet, phAccessHelper, forChildUris, photoAsset, onCallback1)
                            setTimeout( () => {
                                releaseHelperCallback(phAccessHelper,done)
                            }, 1000);
                        } else {
                            console.error('photoAsset failed with err:' + err);
                            expect(false).assertTrue();
                            done();
                        }
                    });
                } else {
                    console.error('fetchResult fail' + err);
                    expect(false).assertTrue();
                    done();
                }
            });
        }

        async function registerChangePromise(callBackSet, uriSet, phAccessHelper, forChildUris, done){
            let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
            let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
            let onCallback1 = (changeData: photoAccessHelper.ChangeData) => {
                console.info('onCallback1 success, changData: ' + JSON.stringify(changeData));
            }
            checkSet(callBackSet, uriSet, phAccessHelper, forChildUris, photoAsset, onCallback1)
            releaseHelperPromise(phAccessHelper,done)
        }

        function getPhotoAssetAttrsCallback(phAccessHelper,fetchOptions, done){
            console.info('photoAsset.get start');
            phAccessHelper.getAssets(fetchOptions, async (err, fetchResult) => {
                if (fetchResult != undefined) {
                    console.info('fetchResult success1');
                    try{
                        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
                        console.info('fetchResult success2');
                        if (photoAsset != undefined) {
                            getPhotoAssetAttrs(photoAsset)
                        }
                    }catch(err){
                        console.error('getFirstObject fail, err is: ' + err.message);
                        expect(false).assertTrue();
                        done();
                    }
                    releaseHelperCallback(phAccessHelper,done)
                } else {
                    console.error('fetchResult fail' + err);
                    expect(false).assertTrue();
                    done();
                }
            });
        }

        async function getPhotoAssetAttrsPromise(phAccessHelper,fetchOptions,done) {
            console.info('photoAsset.get start');
            try {
                let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
                let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
                expect(photoAsset).not().assertUndefined()
                getPhotoAssetAttrs(photoAsset)
                releaseHelperPromise(phAccessHelper,done)
            } catch (err) {
                console.error('getPhotoAssetAttrsPromise failed. message = ', err);
                expect(false).assertTrue();
                done();
            }
        }

        let keyNum1 = 0
        function getPhotoAssetForKeysCallback(phAccessHelper, fetchOptions, done){
            fetchOptions.fetchColumns = [columns[keyNum1]]
            phAccessHelper.getAssets(fetchOptions, async (err, fetchResult) => {
                if (fetchResult != undefined) {
                    let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
                    let photoAssetKey: photoAccessHelper.MemberType = photoAsset.get(columns[keyNum1].toString());
                    expect(photoAssetKey).not().assertUndefined()
                    console.log(`photoAssetKey ${columns[keyNum1]} is : ${photoAssetKey}`)
                    keyNum1++
                    if(keyNum1==17){
                        keyNum1 = 0
                        console.info('getPhotoAssetForKeysCallback getAssets end');
                        releaseHelperCallback(phAccessHelper,done)
                    }else{
                        getPhotoAssetForKeysCallback(phAccessHelper, fetchOptions, done)
                    }
                } else {
                    console.error(`getPhotoAssetForKeysCallback fetchResult fail ${keyNum1}` + err);
                    expect(false).assertTrue();
                    done();
                }
            });
        }

        let keyNum2 = 0
        async function getPhotoAssetForKeysPromise(phAccessHelper, fetchOptions, done){
            try{
                fetchOptions.fetchColumns = [columns[keyNum2]]
                let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
                if (fetchResult != undefined) {
                    let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
                    let photoAssetKey: photoAccessHelper.MemberType = photoAsset.get(columns[keyNum2].toString());
                    expect(photoAssetKey).not().assertUndefined()
                    console.log(`photoAssetKey ${columns[keyNum2]} is : ${photoAssetKey}`)
                    keyNum2++
                    if(keyNum2==17){
                        keyNum2 = 0
                        console.info('getPhotoAssetForKeysPromise getAssets end');
                        releaseHelperPromise(phAccessHelper,done)
                    }else{
                        getPhotoAssetForKeysPromise(phAccessHelper, fetchOptions, done)
                    }
                }
            } catch (err) {
                console.error('getAssets failed, message = ', err);
                expect(false).assertTrue();
                done();
            }
        }

        function setPhotoAssetTitleCallback(phAccessHelper, fetchOptions, done){
            phAccessHelper.getAssets(fetchOptions, async (err, fetchResult) => {
                if (fetchResult != undefined) {
                    let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
                    let titleStr: string = photoAccessHelper.PhotoKeys.TITLE.toString();
                    photoAsset.set(titleStr, 'newTitle');
                    let result = photoAsset.get(titleStr);
                    expect(result).assertEqual('newTitle');
                    console.log(`photoAsset.title is: ${result}`)
                    releaseHelperCallback(phAccessHelper,done)
                } else {
                    console.error(`setPhotoAssetTitleCallback fetchResult fail is: ` + err);
                    expect(false).assertTrue();
                    done();
                }
            });
        }

        async function setPhotoAssetTitlePromise(phAccessHelper, fetchOptions, done){
            try{
                let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
                if (fetchResult != undefined) {
                    let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
                    let titleStr: string = photoAccessHelper.PhotoKeys.TITLE.toString();
                    photoAsset.set(titleStr, 'newTitle');
                    let result = photoAsset.get(titleStr);
                    expect(result).assertEqual('newTitle');
                    console.log(`photoAsset.title is: ${result}`)
                    releaseHelperPromise(phAccessHelper,done)
                }
            } catch (err) {
                console.error('setPhotoAssetTitlePromise failed, message = ', err);
                expect(false).assertTrue();
                done();
            }
        }

        function commitModifyCallback(phAccessHelper, fetchOptions, done){
            fetchOptions.fetchColumns = columns
            phAccessHelper.getAssets(fetchOptions, async (err, fetchResult) => {
                if (fetchResult != undefined) {
                    let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
                    for(let i =0;i<columns.length;i++){
                        let keyStr1: string = columns[i].toString();
                        let initKeyValue: photoAccessHelper.MemberType = photoAsset.get(keyStr1);
                        expect(initKeyValue).not().assertUndefined()
                        console.log(`photoAsset.get init ${columns[i]} is: ${initKeyValue} `)
                    }
                    photoAsset.commitModify((err) => {
                        if (err == undefined) {
                            for(let i = 0;i < columns.length;i++){
                                let keyStr2: string = columns[i].toString();
                                let newKeyValue: photoAccessHelper.MemberType = photoAsset.get(keyStr2);
                                expect(newKeyValue).not().assertUndefined()
                                console.log(`photoAsset.get new ${columns[i]} is: ${newKeyValue} `)
                                if(i==columns.length-1){
                                    releaseHelperCallback(phAccessHelper,done)
                                }
                            }
                        } else {
                            console.error('commitModify failed, message =', err);
                            expect(false).assertTrue();
                            done();
                        }
                    });
                } else {
                    console.error(`commitModifyCallback fetchResult fail is: ` + err);
                    expect(false).assertTrue();
                    done();
                }
            });
        }

        async function commitModifyPromise(phAccessHelper, fetchOptions, done){
            fetchOptions.fetchColumns = columns
            let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
            let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
            let titleStr: string = photoAccessHelper.PhotoKeys.TITLE.toString();
            for(let i =0;i < columns.length;i++){
                let keyStr: string = columns[i].toString();
                let photoAssetKeyValue: photoAccessHelper.MemberType = photoAsset.get(keyStr);
                console.log(`photoAsset.get ${columns[i]} is: ${photoAssetKeyValue} `)
            }
            let photoAssetTitle: photoAccessHelper.MemberType = photoAsset.get(titleStr);
            photoAsset.set(titleStr, 'newTitle3');
            try {
                await photoAsset.commitModify();
                for(let i = 0;i < columns.length;i++){
                    let keyStr2: string = columns[i].toString();
                    let newKeyValue: photoAccessHelper.MemberType = photoAsset.get(keyStr2);
                    console.log(`photoAsset.get new ${columns[i]} is: ${newKeyValue} `)
                    if(i==columns.length-1){
                        releaseHelperPromise(phAccessHelper,done)
                    }
                }
            } catch (err) {
                console.error('release failed. message = ', err);
                expect(false).assertTrue();
                done();
            }
        }

        function getReadOnlyFdCallback(phAccessHelper, fetchOptions, done){
            phAccessHelper.getAssets(fetchOptions, async (err, fetchResult) => {
                if (fetchResult != undefined) {
                    let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
                    photoAsset.getReadOnlyFd((err, fd) => {
                        if (fd != undefined) {
                            console.info('File fd' + fd);
                            checkReadAndWrite(fd)
                            photoAsset.close(fd);
                            releaseHelperCallback(phAccessHelper,done)
                        } else {
                            console.error('File err' + err);
                            expect(false).assertTrue();
                            done();
                        }
                    });
                } else {
                    console.error(`getReadOnlyFdCallback fetchResult fail is: ` + err);
                    expect(false).assertTrue();
                    done();
                }
            });
        }

        async function getReadOnlyFdPromise(phAccessHelper, fetchOptions, done){
            let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
            let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
            try {
                let fd: number = await photoAsset.getReadOnlyFd();
                if (fd != undefined) {
                    console.info('File fd' + fd);
                    await checkReadAndWrite(fd)
                    photoAsset.close(fd);
                    releaseHelperPromise(phAccessHelper,done)
                } else {
                    console.error(' open File fail');
                    expect(false).assertTrue();
                    done();
                }
            } catch (err) {
                console.error('open Demo err' + err);
                expect(false).assertTrue();
                done();
            }
        }

        async function getThumbnailCallback(phAccessHelper,fetchOptions,done){
            let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
            let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
            console.info('photoAsset displayName = ', photoAsset.displayName);
            photoAsset.getThumbnail((err, pixelMap) => {
                if (err == undefined) {
                    expect(pixelMap).not().assertUndefined()
                    console.info('getThumbnail successful ' + pixelMap);
                } else {
                    console.error('getThumbnail fail', err);
                    expect(false).assertTrue();
                    done();
                }
            });
            releaseHelperCallback(phAccessHelper,done)
        }

        async function getThumbnailCallbackWithSize(phAccessHelper,fetchOptions,done){
            let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
            let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
            console.info('photoAsset displayName = ', photoAsset.displayName);
            for(let i = 0;i < sizes.length; i++){
                photoAsset.getThumbnail(sizes[i], (err, pixelMap) => {
                    console.log("i: " + i)
                    if (err == undefined) {
                        console.info('getThumbnail successful ' + pixelMap);
                        if(i>0 && i<4){
                            console.info('getThumbnail error');
                            expect(false).assertTrue();
                            done();
                        }
                        if(i==sizes.length-1){
                            releaseHelperCallback(phAccessHelper,done)
                        }
                    } else {
                        console.info('getThumbnail fail', err);
                        if(i>3 || i<1){
                            console.error('getThumbnail error');
                            expect(false).assertTrue();
                            done();
                        }
                    }
                });
            }
        }

        async function getThumbnailPromiseWithSize(phAccessHelper,fetchOptions,done){
            let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
            let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
            console.info('photoAsset displayName = ', photoAsset.displayName);
            for(let i = 0;i < sizes.length; i++){
                photoAsset.getThumbnail(sizes[i]).then((pixelMap) => {
                    console.info('getThumbnail successful ' + pixelMap);
                    if(i>0 && i<4){
                        console.info('getThumbnail error');
                        expect(false).assertTrue();
                        done();
                    }
                    if(i==sizes.length-1){
                        releaseHelperPromise(phAccessHelper,done)
                    }
                }).catch((err: BusinessError) => {
                    console.error('getThumbnail fail' + err);
                    if(i>3 || i<1){
                        console.info('getThumbnail error');
                        expect(false).assertTrue();
                        done();
                    }
                });
            }
        }

        async function getCount(phAccessHelper,fetchOptions,done){
            let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
            fetchResultCount = fetchResult.getCount();
            console.info('fetchResultCount = ', fetchResultCount);
            expect(fetchResultCount).assertLarger(0)
            releaseHelperPromise(phAccessHelper,done)
        }

        async function checkIsAfterLast(phAccessHelper,fetchOptions,done){
            let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
            let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getLastObject();
            if (fetchResult.isAfterLast()) {
                console.info('photoAsset isAfterLast displayName = ', photoAsset.displayName);
            } else {
                console.info('photoAsset  not isAfterLast ');
                expect(false).assertTrue();
                done();
            }
            releaseHelperPromise(phAccessHelper,done)
        }

        async function closeFetchResult(phAccessHelper,fetchOptions,done){
            try {
                let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
                fetchResult.close();
                try{
                    fetchResult.getCount();
                    expect(false).assertTrue();
                    done();
                } catch (err) {
                    console.info('fetchResult.getCount() fail. message = ' + err);
                    console.info('close succeed.');
                    releaseHelperPromise(phAccessHelper,done)
                }
            } catch (err) {
                console.error('closeFetchResult fail. message = ' + err);
                expect(false).assertTrue();
                done();
            }
        }

        async function getFirstObjectCallback(phAccessHelper,fetchOptions,done){
            try {
                let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
                fetchResult.getFirstObject((err, photoAsset) => {
                    if (photoAsset != undefined) {
                        console.info('photoAsset displayName: ', photoAsset.displayName);
                        releaseHelperCallback(phAccessHelper,done)
                    } else {
                        console.error('photoAsset failed with err:' + err);
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (err) {
                console.error('getFirstObjectCallback fail. message = ' + err);
                expect(false).assertTrue();
                done();
            }
        }

        async function getFirstObjectPromise(phAccessHelper,fetchOptions,done){
            try {
                let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
                let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
                if (photoAsset != undefined) {
                    console.info('photoAsset displayName: ', photoAsset.displayName);
                    releaseHelperPromise(phAccessHelper,done)
                } else {
                    console.error('getFirstObjectPromise failed');
                    expect(false).assertTrue();
                    done();
                }
            } catch (err) {
                console.error('getFirstObjectPromise fail. message = ' + err);
                expect(false).assertTrue();
                done();
            }
        }

        async function getNextObjectCallback(phAccessHelper,fetchOptions,done){
            try {
                let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
                await fetchResult.getFirstObject();
                if (!fetchResult.isAfterLast()) {
                    fetchResult.getNextObject((err, photoAsset) => {
                        if (photoAsset != undefined) {
                            console.info('photoAsset displayName: ', photoAsset.displayName);
                            releaseHelperCallback(phAccessHelper,done)
                        } else {
                            console.error('photoAsset failed with err: ' + err);
                            expect(false).assertTrue();
                            done();
                        }
                    });
                }
            } catch (err) {
                console.error('getNextObjectCallback fail. message = ' + err);
                expect(false).assertTrue();
                done();
            }
        }

        async function getNextObjectPromise(phAccessHelper,fetchOptions,done){
            try {
                let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
                await fetchResult.getFirstObject();
                if (!fetchResult.isAfterLast()) {
                    let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getNextObject();
                    expect(photoAsset).not().assertUndefined()
                    console.info('photoAsset displayName: ', photoAsset.displayName);
                    releaseHelperPromise(phAccessHelper,done)
                }
            } catch (err) {
                console.error('getNextObjectPromise fail. message = ' + err);
                expect(false).assertTrue();
                done();
            }
        }

        async function getLastObjectCallback(phAccessHelper,fetchOptions,done){
            try {
                let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
                await fetchResult.getFirstObject();
                if (!fetchResult.isAfterLast()) {
                    fetchResult.getLastObject((err, photoAsset) => {
                        if (photoAsset != undefined) {
                            expect(fetchResult.isAfterLast()).assertTrue()
                            console.info('photoAsset displayName: ', photoAsset.displayName);
                            releaseHelperCallback(phAccessHelper,done)
                        } else {
                            console.error('photoAsset failed with err: ' + err);
                            expect(false).assertTrue();
                            done();
                        }
                    });
                }
            } catch (err) {
                console.error('getLastObjectCallback fail. message = ' + err);
                expect(false).assertTrue();
                done();
            }
        }

        async function getLastObjectPromise(phAccessHelper,fetchOptions,done){
            try {
                let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
                await fetchResult.getFirstObject();
                if (!fetchResult.isAfterLast()) {
                    let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getLastObject();
                    expect(fetchResult.isAfterLast()).assertTrue()
                    releaseHelperPromise(phAccessHelper,done)
                }
            } catch (err) {
                console.error('getLastObjectPromise fail. message = ' + err);
                expect(false).assertTrue();
                done();
            }
        }

        async function getObjectByPositionCallback(phAccessHelper,fetchOptions,done){
            try {
                let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
                await fetchResult.getFirstObject();
                let positions = [
                    0,1,fetchResultCount-1
                ]
                for(let i = 0;i < 3; i++){
                    console.log(`positions[${i}] is: ${positions[i]}`)
                    fetchResult.getObjectByPosition(positions[i], (err, photoAsset) => {
                        if (photoAsset != undefined) {
                            console.log(`positions[${i}]:${positions[i]} get success`)
                            console.info('photoAsset displayName: ', photoAsset.displayName);
                            if(i==1){
                                releaseHelperCallback(phAccessHelper,done)
                            }
                        } else {
                            console.error('photoAsset failed with err: ' + err);
                            expect(false).assertTrue();
                            done();
                        }
                    });
                }
            } catch (err) {
                console.error('getObjectByPositionCallback fail. message = ' + err);
                expect(false).assertTrue();
                done();
            }
        }

        async function getObjectByPositionPromise(phAccessHelper,fetchOptions,done){
            try {
                let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
                let positions = [
                    0,1,fetchResultCount-1
                ]
                for(let i = 0;i < 3; i++){
                    console.log(`positions[${i}] is: ${positions[i]}`)
                    let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getObjectByPosition(positions[i]);
                    if (photoAsset != undefined) {
                        console.log(`positions[${i}]:${positions[i]} get success`)
                        console.info('photoAsset displayName: ', photoAsset.displayName);
                        if(i==1){
                            releaseHelperPromise(phAccessHelper,done)
                        }
                    }
                }
            } catch (err) {
                console.error('close fail. message = ' + err);
                expect(false).assertTrue();
                done();
            }
        }

        async function getAllObjectsCallback(phAccessHelper,fetchOptions,done){
            try {
                let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
                fetchResult.getAllObjects((err, photoAssetList) => {
                    if (photoAssetList != undefined) {
                        console.info('photoAssetList length: ', photoAssetList.length);
                        expect(photoAssetList.length).assertEqual(fetchResultCount)
                        releaseHelperCallback(phAccessHelper,done)
                    } else {
                        console.error('photoAssetList failed with err:' + err);
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (err) {
                console.error('close fail. message = ' + err);
                expect(false).assertTrue();
                done();
            }
        }

        async function getAllObjectsPromise(phAccessHelper,fetchOptions,done){
            try {
                let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
                let photoAssetList: Array<photoAccessHelper.PhotoAsset> = await fetchResult.getAllObjects();
                console.info('photoAssetList length: ', photoAssetList.length);
                expect(photoAssetList.length).assertEqual(fetchResultCount)
                releaseHelperPromise(phAccessHelper,done)
            } catch (err) {
                console.error('close fail. message = ' + err);
                expect(false).assertTrue();
                done();
            }
        }

        function releaseHelperCallback(phAccessHelper,done){
            phAccessHelper.release((err) => {
                console.info('releaseDemo');
                if (err != undefined) {
                    console.error('release failed. message = ', err);
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info('release ok.');
                    done();
                }
            });
        }

        async function releaseHelperPromise(phAccessHelper,done){
            try {
                await phAccessHelper.release();
                console.info('release ok.');
                done();
            } catch (err) {
                console.error('release failed. message = ', err);
                expect(false).assertTrue();
                done();
            }
        }

        beforeAll(async function() {
            console.info('beforeAll case');
            await getPermission();
        })

        beforeEach(async function() {
            console.info('beforeEach case');
        })

        afterEach(async function() {
            console.info('afterEach case');
            fetchOptions.fetchColumns = []
            options = {
                title: 'testPhoto'
            }
        })

        afterAll(async function() {
            console.info('afterAll case');
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0100
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0100
           * @tc.desc      : getPhotoAccessHelper with correct context
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level1
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0100', 1, async function (done) {
            try{
                let photoHelper = getPhotoHelper(context)
                releaseHelperCallback(photoHelper,done)
                console.info('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0100 excute pass');
            } catch(err){
                console.error('getPhotoAccessHelper failed , catch err is  ' + err.message);
                expect(false).assertTrue();
                done()
            }
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0200
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0200
           * @tc.desc      : getAssets with callback fetchOptions.fetchColumns = []
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level1
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0200', 1, async function (done) {
            let photoHelper = getPhotoHelper(context)
            try{
                getAssetsAndReleaseCallback(photoHelper,fetchOptions,done)
            } catch(err){
                console.error('getPhotoAccessHelper 0200 getAssets failed , catch err is  ' + err.message);
                expect(false).assertTrue();
                done();
            }
            console.info('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0200 excute pass');
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0210
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0210
           * @tc.desc      : getAssets with promise fetchOptions.fetchColumns = []
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0210', 2, async function (done) {
            let photoHelper = getPhotoHelper(context)
            try{
                getAssetsAndReleasePromise(photoHelper,fetchOptions,done)
            } catch(err){
                console.error('getPhotoAccessHelper 0210 getAssets failed , catch err is  ' + err.message);
                expect(false).assertTrue();
                done();
            }
            console.info('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0210 excute pass');
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0300
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0300
           * @tc.desc      : getAssets with callback fetchOptions.fetchColumns = columns, all photoKeys
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0300', 3, async function (done) {
            let photoHelper = getPhotoHelper(context)
            getAssetsForKeysCallback(photoHelper, fetchOptions, 'SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0300', done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0400
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0400
           * @tc.desc      : getAssets with promise fetchOptions.fetchColumns = columns, all photoKeys
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0400', 3, async function (done) {
            let photoHelper = getPhotoHelper(context)
            getAssetsForKeysPromise(photoHelper, fetchOptions, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0500
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0500
           * @tc.desc      : getAssets with callback fetchOptions.fetchColumns = [uri,displayName,photoType]
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0500', 2, async function (done) {
            let photoHelper = getPhotoHelper(context)
            setArgGetAssetsCallback(photoHelper,[photoKeys.URI,photoKeys.DISPLAY_NAME,photoKeys.PHOTO_TYPE],
                'SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0500',done)
        })

        /* *
       * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0510
       * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0510
       * @tc.desc      : getAssets with promise fetchOptions.fetchColumns = [uri,displayName,photoType]
       * @tc.size      : MediumTest
       * @tc.type      : Function test
       * @tc.level     : Level4
       */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0510', 4, async function (done) {
            let photoHelper = getPhotoHelper(context)
            setArgGetAssetsPromise(photoHelper,[photoKeys.URI,photoKeys.DISPLAY_NAME,photoKeys.PHOTO_TYPE],
                'SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0510',done)
        })
        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0600
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0600
           * @tc.desc      : createAsset callback with imageType and photoExtensions
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0600', 3, function (done) {
            let photoHelper = getPhotoHelper(context)
            createAssetWithSuffixesCallback1(photoHelper,imageType, 'jpg', options, photoExtensions, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0700
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0700
           * @tc.desc      : createAsset callback with videoType and videoExtensions
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0700', 3, function (done) {
            let photoHelper = getPhotoHelper(context)
            createAssetWithSuffixesCallback1(photoHelper, videoType, 'mp4', options, videoExtensions, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0800
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0800
           * @tc.desc      : createAsset callback with imageType and photoExtensions, without options
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0800', 3, function (done) {
            let photoHelper = getPhotoHelper(context)
            createAssetWithSuffixesCallback2(photoHelper, imageType, 'jpg', photoExtensions, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0900
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0900
           * @tc.desc      : createAsset callback with videoType and videoExtensions, without options
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0900', 3, function (done) {
            let photoHelper = getPhotoHelper(context)
            createAssetWithSuffixesCallback2(photoHelper, videoType, 'mp4', videoExtensions, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1000
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1000
           * @tc.desc      : createAsset promise with imageType and photoExtensions, without options
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1000', 2, function (done) {
            let photoHelper = getPhotoHelper(context)
            createAssetWithSuffixesPromise(photoHelper, imageType, 'jpg', options, photoExtensions, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1100
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1100
           * @tc.desc      : createAsset promise with videoType and videoExtensions, without options
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1100', 2, function (done) {
            let photoHelper = getPhotoHelper(context)
            createAssetWithSuffixesPromise(photoHelper, videoType, 'mp4', options, videoExtensions, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1200
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1200
           * @tc.desc      : createAsset promise with imageType and photoExtensions, with options
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1200', 3, function (done) {
            let photoHelper = getPhotoHelper(context)
            let withoutOptions =  {
                title: 'no'
            }
            createAssetWithSuffixesPromise(photoHelper, imageType, 'jpg', withoutOptions, photoExtensions, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1300
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1300
           * @tc.desc      : createAsset promise with videoType and videoExtensions, with options
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1300', 3, function (done) {
            let photoHelper = getPhotoHelper(context)
            let withoutOptions =  {
                title: 'no'
            }
            createAssetWithSuffixesPromise(photoHelper, videoType, 'mp4', withoutOptions, videoExtensions, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1400
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1400
           * @tc.desc      : createAsset promise with imageType and photoExtensions, with disallowed options
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level4
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1400', 4, function (done) {
            let photoHelper = getPhotoHelper(context)
            let optionsErr =  {
                testError: 'testError'
            }
            createAssetWithSuffixesPromise(photoHelper, imageType, 'jpg', optionsErr, photoExtensions, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1500
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1500
           * @tc.desc      : createAsset promise with videoType and videoExtensions, with disallowed options
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1500', 3, function (done) {
            let photoHelper = getPhotoHelper(context)
            let optionsErr =  {
                testError: 'testError'
            }
            createAssetWithSuffixesPromise(photoHelper, videoType, 'mp4', optionsErr, videoExtensions, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1600
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1600
           * @tc.desc      : registerChange promise, register photoAsset.uri,unRegister prescriptive callback,
                             forChildUris=true
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1600', 3, function (done) {
            let photoHelper = getPhotoHelper(context)
            registerChangePromise(true, true, photoHelper, true, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1700
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1700
           * @tc.desc      : registerChange promise, register photoAsset.uri,unRegister prescriptive callback,
                             forChildUris=false
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1700', 3, function (done) {
            let photoHelper = getPhotoHelper(context)
            registerChangePromise(true, true, photoHelper, false, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1800
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1800
           * @tc.desc      : registerChange promise, register DEFAULT_PHOTO_URI,unRegister prescriptive callback,
                             forChildUris=true
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1800', 3, function (done) {
            let photoHelper = getPhotoHelper(context)
            registerChangePromise(true, false, photoHelper, true, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1900
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1900
           * @tc.desc      : registerChange promise, register DEFAULT_PHOTO_URI,unRegister prescriptive callback,
                             forChildUris=false
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1900', 3, function (done) {
            let photoHelper = getPhotoHelper(context)
            registerChangePromise(true, false, photoHelper, false, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2000
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2000
           * @tc.desc      : registerChange promise, register photoAsset.uri,unRegister all callback,
                             forChildUris=true
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2000', 3, function (done) {
            let photoHelper = getPhotoHelper(context)
            registerChangePromise(false, true, photoHelper, true, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2100
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2100
           * @tc.desc      : registerChange promise, register photoAsset.uri,unRegister all callback,
                             forChildUris=false
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2100', 3, function (done) {
            let photoHelper = getPhotoHelper(context)
            registerChangePromise(false, true, photoHelper, false, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2200
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2200
           * @tc.desc      : registerChange promise, register DEFAULT_PHOTO_URI,unRegister all callback,
                             forChildUris=true
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2200', 3, function (done) {
            let photoHelper = getPhotoHelper(context)
            registerChangePromise(false, false, photoHelper, true, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2300
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2300
           * @tc.desc      : registerChange promise, register DEFAULT_PHOTO_URI,unRegister all callback,
                             forChildUris=false
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2300', 3, function (done) {
            let photoHelper = getPhotoHelper(context)
            registerChangePromise(false, false, photoHelper, false, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2400
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2400
           * @tc.desc      : registerChange callback, register photoAsset.uri,unRegister prescriptive callback,
                             forChildUris=true
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2400', 3, function (done) {
            let photoHelper = getPhotoHelper(context)
            registerChangeCallback(true, true, photoHelper, true, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2500
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2500
           * @tc.desc      : registerChange callback, register photoAsset.uri,unRegister prescriptive callback,
                             forChildUris=false
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2500', 3, function (done) {
            let photoHelper = getPhotoHelper(context)
            registerChangeCallback(true, true, photoHelper, false, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2600
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2600
           * @tc.desc      : registerChange callback, register DEFAULT_PHOTO_URI,unRegister prescriptive callback,
                             forChildUris=true
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2600', 3, function (done) {
            let photoHelper = getPhotoHelper(context)
            registerChangeCallback(true, false, photoHelper, true, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2700
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2700
           * @tc.desc      : registerChange callback, register DEFAULT_PHOTO_URI,unRegister prescriptive callback,
                             forChildUris=false
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2700', 3, function (done) {
            let photoHelper = getPhotoHelper(context)
            registerChangeCallback(true, false, photoHelper, false, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2800
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2800
           * @tc.desc      : registerChange callback, register photoAsset.uri,unRegister all callback,
                             forChildUris=true
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2800', 3, function (done) {
            let photoHelper = getPhotoHelper(context)
            registerChangeCallback(false, true, photoHelper, true, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2900
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2900
           * @tc.desc      : registerChange callback, register photoAsset.uri,unRegister all callback,
                             forChildUris=false
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2900', 3, function (done) {
            let photoHelper = getPhotoHelper(context)
            registerChangeCallback(false, true, photoHelper, false, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3000
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3000
           * @tc.desc      : registerChange callback, register DEFAULT_PHOTO_URI,unRegister all callback,
                             forChildUris=true
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3000', 3, function (done) {
            let photoHelper = getPhotoHelper(context)
            registerChangeCallback(false, false, photoHelper, true, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3100
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3100
           * @tc.desc      : registerChange callback, register DEFAULT_PHOTO_URI,unRegister all callback,
                             forChildUris=false
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3100', 3, function (done) {
            let photoHelper = getPhotoHelper(context)
            registerChangeCallback(false, false, photoHelper, false, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3400
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3400
           * @tc.desc      : photoAsset.get callback
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3400', 3, function (done) {
            let photoHelper = getPhotoHelper(context)
            getPhotoAssetAttrsCallback(photoHelper,fetchOptions, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3500
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3500
           * @tc.desc      : photoAsset.get promise
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3500', 3, function (done) {
            let photoHelper = getPhotoHelper(context)
            getPhotoAssetAttrsPromise(photoHelper, fetchOptions, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3600
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3600
           * @tc.desc      : photoAsset.get callback, for all photoKeys
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3600', 3, function (done) {
            let photoHelper = getPhotoHelper(context)
            getPhotoAssetForKeysCallback(photoHelper, fetchOptions, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3700
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3700
           * @tc.desc      : photoAsset.get promise, for all photoKeys
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3700', 3, function (done) {
            let photoHelper = getPhotoHelper(context)
            getPhotoAssetForKeysPromise(photoHelper, fetchOptions, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3800
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3800
           * @tc.desc      : photoAsset.set(title) callback
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3800', 3, function (done) {
            let photoHelper = getPhotoHelper(context)
            setPhotoAssetTitleCallback(photoHelper, fetchOptions, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3900
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3900
           * @tc.desc      : photoAsset.set(title) promise
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3900', 3, function (done) {
            let photoHelper = getPhotoHelper(context)
            setPhotoAssetTitlePromise(photoHelper, fetchOptions, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_4000
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_4000
           * @tc.desc      : photoAsset.commitModify callback
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level1
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_4000', 1, function (done) {
            let photoHelper = getPhotoHelper(context)
            commitModifyCallback(photoHelper, fetchOptions, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_4100
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_4100
           * @tc.desc      : photoAsset.commitModify promise
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level1
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_4100', 1, function (done) {
            let photoHelper = getPhotoHelper(context)
            commitModifyPromise(photoHelper, fetchOptions, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_4200
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_4200
           * @tc.desc      : getReadOnlyFd callback
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_4200', 3, function (done) {
            let photoHelper = getPhotoHelper(context)
            getReadOnlyFdCallback(photoHelper, fetchOptions, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_4300
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_4300
           * @tc.desc      : getReadOnlyFd promise
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_4300', 3, function (done) {
            let photoHelper = getPhotoHelper(context)
            getReadOnlyFdPromise(photoHelper, fetchOptions, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_4400
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_4400
           * @tc.desc      : getThumbnail callback
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level1
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_4400', 1, function (done) {
            let photoHelper = getPhotoHelper(context)
            getThumbnailCallback(photoHelper, fetchOptions_allocate_file, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_4500
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_4500
           * @tc.desc      : getThumbnail callback with sizes
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_4500', 4, function (done) {
            let photoHelper = getPhotoHelper(context)
            getThumbnailCallbackWithSize(photoHelper, fetchOptions_allocate_file, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_4600
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_4600
           * @tc.desc      : getThumbnail promise with sizes
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_4600', 4, function (done) {
            let photoHelper = getPhotoHelper(context)
            fetchOptions.fetchColumns = columns
            getThumbnailPromiseWithSize(photoHelper, fetchOptions_allocate_file, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_4700
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_4700
           * @tc.desc      : fetchResult.getCount
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_4700', 2, function (done) {
            let photoHelper = getPhotoHelper(context)
            getCount(photoHelper,fetchOptions,done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_4800
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_4800
           * @tc.desc      : fetchResult.isAfterLast
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_4800', 2, function (done) {
            let photoHelper = getPhotoHelper(context)
            checkIsAfterLast(photoHelper,fetchOptions,done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_4900
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_4900
           * @tc.desc      : fetchResult.close
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_4900', 3, function (done) {
            let photoHelper = getPhotoHelper(context)
            closeFetchResult(photoHelper,fetchOptions,done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_5000
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_5000
           * @tc.desc      : getFirstObject callback
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_5000', 2, function (done) {
            let photoHelper = getPhotoHelper(context)
            getFirstObjectCallback(photoHelper,fetchOptions,done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_5010
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_5010
           * @tc.desc      : getFirstObject promise
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_5010', 2, function (done) {
            let photoHelper = getPhotoHelper(context)
            getFirstObjectPromise(photoHelper,fetchOptions,done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_5100
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_5100
           * @tc.desc      : getNextObject callback
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_5100', 3, function (done) {
            let photoHelper = getPhotoHelper(context)
            getNextObjectCallback(photoHelper,fetchOptions,done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_5200
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_5200
           * @tc.desc      : getNextObject promise
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_5200', 3, function (done) {
            let photoHelper = getPhotoHelper(context)
            getNextObjectPromise(photoHelper,fetchOptions,done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_5300
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_5300
           * @tc.desc      : getLastObject callback
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_5300', 3, function (done) {
            let photoHelper = getPhotoHelper(context)
            getLastObjectCallback(photoHelper,fetchOptions,done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_5400
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_5400
           * @tc.desc      : getLastObject promise
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_5400', 3, function (done) {
            let photoHelper = getPhotoHelper(context)
            getLastObjectPromise(photoHelper,fetchOptions,done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_5500
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_5500
           * @tc.desc      : getObjectByPosition callback -1 0 1
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_5500', 3, function (done) {
            let photoHelper = getPhotoHelper(context)
            getObjectByPositionCallback(photoHelper,fetchOptions,done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_5600
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_5600
           * @tc.desc      : getObjectByPosition promise -1 0 1
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_5600', 3, function (done) {
            let photoHelper = getPhotoHelper(context)
            getObjectByPositionPromise(photoHelper,fetchOptions,done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_5700
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_5700
           * @tc.desc      : getAllObjects callback
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_5700', 3, function (done) {
            let photoHelper = getPhotoHelper(context)
            getAllObjectsCallback(photoHelper,fetchOptions,done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_5800
           * @tc.name      : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_5800
           * @tc.desc      : getAllObjects promise
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_5800', 3, function (done) {
            let photoHelper = getPhotoHelper(context)
            getAllObjectsPromise(photoHelper,fetchOptions,done)
        })
    })
}
