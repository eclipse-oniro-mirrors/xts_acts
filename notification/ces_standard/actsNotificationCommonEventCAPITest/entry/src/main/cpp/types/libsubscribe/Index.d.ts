/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
export const add: (a: number, b: number) => number;
export const createParameters: () => number;
export const destroyParameters: () => number;
export const setIntToParameters: () => number;
export const setIntArrayToParameters: () => number;
export const setLongToParameters: () => number;
export const setLongArrayToParameters: () => number;
export const setDoubleToParameters: () => number;
export const setDoubleArrayToParameters: () => number;
export const setBoolToParameters: () => number;
export const setBoolArrayToParameters: () => number;
export const setCharToParameters: () => number;
export const setCharArrayToParameters: () => number;

export const createPublishInfo: () => number;
export const destroyPublishInfo: () => number;
export const setPublishInfoBundleName: () => number;
export const setPublishInfoPermissions: () => number;
export const setPublishInfoCode: () => number;
export const getSetPublishInfoCode: () => number;
export const setPublishInfoData: () => number;
export const getSetPublishInfoData: () => number;
export const setPublishInfoParameters: () => number;
export const getSetPublishInfoParameters: () => number;

export const publish: () => number;
export const publishWithInfo: () => number;

export const isOrderedCommonEvent: () => number;
export const getIsOrderedCommonEvent: () => number;
export const finishCommonEvent: () => number;
export const getFinishCommonEvent: () => number;
export const getAbortCommonEvent: () => number;
export const getGetAbortCommonEvent: () => number;
export const abortCommonEvent: () => number;
export const getAbortCommonEvent2: () => number;
export const clearAbortCommonEvent: () => number;
export const getClearAbortCommonEvent: () => number;
export const subscriberCommonEvent: () => number;
export const getGetCodeFromSubscriber: () => number;
export const getSetCodeToSubscriber: () => number;
export const getGetDataFromSubscriber: () => number;
export const getSetDataToSubscriber: () => number;
export const getSetPublishInfoBundleName: () => number;