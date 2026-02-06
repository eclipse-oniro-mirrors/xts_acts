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

import huks from '@ohos.security.huks';

export function generateKey(srcKeyAlias, HuksOptions) {
    return new Promise((resolve, reject) => {
        huks.generateKey(srcKeyAlias, HuksOptions, function (err, data) {
            if (err.code !== 0) {
                reject(err);
            } else {
                resolve(data);
            }
        });
    });
}

export function exportKey(srcKeyAlias, HuksOptions) {
    return new Promise((resolve, reject) => {
        huks.exportKey(srcKeyAlias, HuksOptions, function (err, data) {
            if (err.code !== 0) {
                reject(err);
            } else {
                resolve(data);
            }
        });
    });
}

export function importKey(srcKeyAlias, HuksOptions) {
    return new Promise((resolve, reject) => {
        huks.importKey(srcKeyAlias, HuksOptions, function (err, data) {
            if (err.code !== 0) {
                reject(err);
            } else {
                resolve(data);
            }
        });
    });
}

export function init(srcKeyAlias, HuksOptions) {
    return new Promise((resolve, reject) => {
        huks.init(srcKeyAlias, HuksOptions, function (err, data) {
            if (err.code !== 0) {
                reject(err);
            } else {
                resolve(data);
            }
        });
    });
}

export function update(handle, HuksOptions) {
    return new Promise((resolve, reject) => {
        huks.update(handle, HuksOptions, function (err, data) {
            if (err.code !== 0) {
                reject(err);
            } else {
                resolve(data);
            }
        });
    });
}

export function finish(handle, HuksOptionsFinish) {
    return new Promise((resolve, reject) => {
        huks.finish(handle, HuksOptionsFinish, function (err, data) {
            if (err.code !== 0) {
                reject(err);
            } else {
                resolve(data);
            }
        });
    });
}

export function abort(handle, HuksOptionsAbort) {
    return new Promise((resolve, reject) => {
        huks.abort(handle, HuksOptionsAbort, function (err, data) {
            if (err.code !== 0) {
                reject(err);
            } else {
                resolve(data);
            }
        });
    });
}

export function deleteKey(srcKeyAlias, HuksOptions) {
    return new Promise((resolve, reject) => {
        huks.deleteKey(srcKeyAlias, HuksOptions, function (err, data) {
            if (err.code !== 0) {
                reject(err);
            } else {
                resolve(data);
            }
        });
    });
}

export function isKeyExist(srcKeyAlias, HuksOptions) {
    return new Promise((resolve, reject) => {
        huks.isKeyExist(srcKeyAlias, HuksOptions, function (err, data) {
            if (err.code !== 0) {
                reject(err);
            } else {
                resolve(data);
            }
        });
    });
}

export function getKeyProperties(srcKeyAlias, HuksOptions) {
    return new Promise((resolve, reject) => {
        huks.getKeyProperties(srcKeyAlias, HuksOptions, function (err, data) {
            if (err.code !== 0) {
                reject(err);
            } else {
                resolve(data);
            }
        });
    });
}