/* 
 * Copyright (C) 2024 Huawei Device Co., Ltd. 
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
import resourceManager from '@ohos.resourceManager';

export const getFileList: (resmgr: resourceManager.ResourceManager, path: string) => Array<String>;
export const getRawFileContent: (resmgr: resourceManager.ResourceManager, path: string) => Uint8Array;
export const getRawFileDescriptor: (resmgr: resourceManager.ResourceManager, path: string) => resourceManager.RawFileDescriptor;
export const getRawFileDescriptor64: (resmgr: resourceManager.ResourceManager, path: string) => resourceManager.RawFileDescriptor;
export const isRawDir: (resmgr: resourceManager.ResourceManager, path: string) => Boolean;
export const getDrawableDescriptor: (resmgr: resourceManager.ResourceManager, id: number) => Boolean;
export const getDrawableDescriptorByName: (resmgr: resourceManager.ResourceManager) => Boolean;
export const getMediaBase64: (resmgr: resourceManager.ResourceManager, id: number) => Boolean;
export const getMediaBase64ByName: (resmgr: resourceManager.ResourceManager) => Boolean;
export const getMedia: (resmgr: resourceManager.ResourceManager, id: number) => Boolean;
export const getMediaByName: (resmgr: resourceManager.ResourceManager) => Boolean;
export const getSymbolByName: (resmgr: resourceManager.ResourceManager) => Boolean;
export const getSymbol: (resmgr: resourceManager.ResourceManager, id: number) => Boolean;
export const getBoolByName: (resmgr: resourceManager.ResourceManager) => Boolean;
export const getBool: (resmgr: resourceManager.ResourceManager, id: number) => Boolean;
export const getPluralStringByName: (resmgr: resourceManager.ResourceManager) => Boolean;
export const getPluralString: (resmgr: resourceManager.ResourceManager, resId: number, num: number) => Boolean;
export const getColorByName: (resmgr: resourceManager.ResourceManager) => number;
export const getColor: (resmgr: resourceManager.ResourceManager, id: number) => number;
export const getIntByName: (resmgr: resourceManager.ResourceManager) => Boolean;
export const getInt: (resmgr: resourceManager.ResourceManager, resId: number) => Boolean;
export const getFloatByName: (resmgr: resourceManager.ResourceManager) => Boolean;
export const getFloat: (resmgr: resourceManager.ResourceManager, resId: number) => Boolean;
export const getLocales: (resmgr: resourceManager.ResourceManager) => Array<String>;
export const getConfiguration: (resmgr: resourceManager.ResourceManager) => Boolean;
export const getStringArray: (resmgr: resourceManager.ResourceManager, resId: number) => Array<String>;
export const getStringArrayByName: (resmgr: resourceManager.ResourceManager) => Array<String>;
export const releaseStringArray: (resmgr: resourceManager.ResourceManager) => Boolean;
export const releaseConfiguration: (resmgr: resourceManager.ResourceManager) => Boolean;
export const getStringByName: (resmgr: resourceManager.ResourceManager) => Boolean;
export const getString: (resmgr: resourceManager.ResourceManager, resId: number) => Boolean;
export const getRawFileDescriptorData: (resmgr: resourceManager.ResourceManager, path: string) => resourceManager.RawFileDescriptor;
export const getLocalesData: (resmgr: resourceManager.ResourceManager) => Array<String>;
export const getMediaBase64DataByName: (resmgr: resourceManager.ResourceManager, name: string) => string;
export const getMediaBase64Data: (resmgr: resourceManager.ResourceManager, resId: number) => string;
export const getMediaData: (resmgr: resourceManager.ResourceManager, resId: number) => Boolean;
export const getMediaDataByName: (resmgr: resourceManager.ResourceManager, name: string) => Boolean;
export const getDrawableDescriptorData: (resmgr: resourceManager.ResourceManager, resId: number) => Boolean;
export const getDrawableDescriptorDataByName: (resmgr: resourceManager.ResourceManager, name: string) => Boolean;
export const addResource: (resmgr: resourceManager.ResourceManager) => number;
export const removeResource: (resmgr: resourceManager.ResourceManager) => Boolean;
export const getRawFileContentTwo: (resmgr: resourceManager.ResourceManager, path: string) => Uint8Array;
export const testGetIntPluralStringById0790_082: (resmgr: resourceManager.ResourceManager, resId: number) => Boolean;
export const testGetIntPluralStringByName0790_082: (resmgr: resourceManager.ResourceManager, resName: string) => Boolean;
export const testGetDoublePluralStringById0790_082: (resmgr: resourceManager.ResourceManager, resId: number) => Boolean;
export const testGetDoublePluralStringByName0790_082: (resmgr: resourceManager.ResourceManager, resName: string) => Boolean;
export const testGetIntPluralStringById119: (resmgr: resourceManager.ResourceManager, resId: number) => Boolean;
export const testGetDoublePluralStringById120: (resmgr: resourceManager.ResourceManager, resId: number) => Boolean;
export const testGetIntPluralStringById125: (resmgr: resourceManager.ResourceManager, resId: number) => Boolean;
export const testGetDoublePluralStringById126: (resmgr: resourceManager.ResourceManager, resId: number) => Boolean;
export const testGetIntPluralStringById127: (resmgr: resourceManager.ResourceManager, resId: number, resIdTwo: number) => Boolean;
export const testGetDoublePluralStringById128: (resmgr: resourceManager.ResourceManager, resId: number, resIdTwo: number) => Boolean;
export const testGetIntPluralStringById129: (resmgr: resourceManager.ResourceManager, resId: number, resIdTwo: number) => Boolean;
export const testGetDoublePluralStringById130: (resmgr: resourceManager.ResourceManager, resId: number, resIdTwo: number) => Boolean;
export const testGetIntPluralStringByName133: (resmgr: resourceManager.ResourceManager, resName: string) => Boolean;
export const testGetDoublePluralStringByName134: (resmgr: resourceManager.ResourceManager, resName: string) => Boolean;
export const testGetIntPluralStringByName139: (resmgr: resourceManager.ResourceManager, resName: string) => Boolean;
export const testGetDoublePluralStringByName140: (resmgr: resourceManager.ResourceManager, resName: string) => Boolean;
export const testGetIntPluralStringByName141: (resmgr: resourceManager.ResourceManager, resName: string) => Boolean;
export const testGetDoublePluralStringByName142: (resmgr: resourceManager.ResourceManager, resName: string) => Boolean;
export const getResourceConfiguration: (resmgr: resourceManager.ResourceManager) => Boolean;