/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
export const EncoderConfigureLCAAC: () => Promise<number>;

export const EncoderConfigureHEAAC: () => Promise<number>;

export const EncoderConfigureHEAACv2: () => Promise<number>;

export const EncoderConfigureByCap: () => Promise<number>;

export const SampleRate: () => Promise<number>;

export const ChannelCountV1: () => Promise<number>;

export const ChannelCountV2: () => Promise<number>;

export const ChannelLayoutV1: () => Promise<number>;

export const ChannelLayoutV2: () => Promise<number>;

export const AacProfile: () => Promise<number>;

