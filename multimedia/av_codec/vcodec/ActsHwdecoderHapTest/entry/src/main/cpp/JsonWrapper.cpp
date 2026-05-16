/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
#include "JsonWrapper.h"
#include <cctype>
#include <fstream>
#include <sstream>

bool JsonWrapper::LoadFromFile(const std::string& path)
{
    std::ifstream f(path, std::ios::in);
    if (!f.is_open()) {
        return false;
    }

    std::stringstream buffer;
    buffer << f.rdbuf();
    content_ = buffer.str();
    return ParseTopLevel();
}

std::string JsonWrapper::GetString(const std::string& fileName, const std::string& pixFmt) const
{
    auto itFile = data_.find(fileName);
    if (itFile != data_.end()) {
        auto itFmt = itFile->second.find(pixFmt);
        if (itFmt != itFile->second.end()) {
            return itFmt->second;
        }
    }
    return "";
}

// --------------------- 内部函数实现 ---------------------

std::string JsonWrapper::Trim(const std::string& s)
{
    size_t start = 0;
    while (start < s.size() && std::isspace(static_cast<unsigned char>(s[start])))
        start++;
    size_t end = s.size();
    while (end > start && std::isspace(static_cast<unsigned char>(s[end - 1])))
        end--;
    return s.substr(start, end - start);
}

namespace {
constexpr size_t MIN_QUOTED_STRING_LEN = 2;
}

std::string JsonWrapper::StripQuotes(const std::string& s)
{
    if (s.size() >= MIN_QUOTED_STRING_LEN && s.front() == '"' && s.back() == '"') {
        return s.substr(1, s.size() - MIN_QUOTED_STRING_LEN);
    }
    return s;
}

bool JsonWrapper::ParseTopLevel()
{
    size_t pos = 0;
    SkipWhitespace(pos);
    if (pos >= content_.size() || content_[pos] != '{')
        return false;
    pos++; // skip {

    while (pos < content_.size()) {
        SkipWhitespace(pos);
        if (content_[pos] == '}')
            break;

        std::string key = ParseString(pos);
        if (key.empty())
            return false;
        SkipWhitespace(pos);
        if (content_[pos] != ':')
            return false;
        pos++; // skip :

        auto valueMap = ParseInnerObject(pos);
        if (valueMap.empty())
            return false;
        data_[key] = std::move(valueMap);

        SkipWhitespace(pos);
        if (content_[pos] == ',')
            pos++;
    }
    return true;
}

std::unordered_map<std::string, std::string> JsonWrapper::ParseInnerObject(size_t& pos)
{
    std::unordered_map<std::string, std::string> map;
    SkipWhitespace(pos);
    if (pos >= content_.size() || content_[pos] != '{')
        return map;
    pos++; // skip {

    while (pos < content_.size()) {
        SkipWhitespace(pos);
        if (content_[pos] == '}') {
            pos++;
            break;
        }
        std::string key = ParseString(pos);
        SkipWhitespace(pos);
        if (content_[pos] != ':')
            return {};
        pos++; // skip :
        SkipWhitespace(pos);
        std::string value = ParseString(pos);
        map[key] = value;
        SkipWhitespace(pos);
        if (content_[pos] == ',')
            pos++;
    }
    return map;
}

std::string JsonWrapper::ParseString(size_t& pos)
{
    SkipWhitespace(pos);
    if (pos >= content_.size() || content_[pos] != '"')
        return "";
    pos++; // skip "
    size_t start = pos;
    while (pos < content_.size() && content_[pos] != '"')
        pos++;
    std::string result = content_.substr(start, pos - start);
    if (pos < content_.size())
        pos++; // skip ending "
    return result;
}

void JsonWrapper::SkipWhitespace(size_t& pos)
{
    while (pos < content_.size() && std::isspace(static_cast<unsigned char>(content_[pos])))
        pos++;
}