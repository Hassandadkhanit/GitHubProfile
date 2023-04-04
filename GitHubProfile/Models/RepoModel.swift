//
//  RepoModel.swift
//  GitHubProfile
//
//  Created by Hassan dad khan on 22/02/2023.
//

import Foundation

struct RepoModel: Codable {
    let id: Int?
    let nodeId: String?
    let name: String?
    let fullName: String?
    let privateStatus: Bool?
    let owner: Owner?
    let htmlUrl: String?
    let description: String?
    let fork: Bool?
    let url: String?
    let forksUrl: String?
    let keysUrl: String?
    let collaboratorsUrl: String?
    let teamsUrl: String?
    let hooksUrl: String?
    let issueEventsUrl: String?
    let eventsUrl: String?
    let assigneesUrl: String?
    let branchesUrl: String?
    let tagsUrl: String?
    let blobsUrl: String?
    let gitTagsUrl: String?
    let gitRefsUrl: String?
    let treesUrl: String?
    let statusesUrl: String?
    let languagesUrl: String?
    let stargazersUrl: String?
    let contributorsUrl: String?
    let subscribersUrl: String?
    let subscriptionUrl: String?
    let commitsUrl: String?
    let gitCommitsUrl: String?
    let commentsUrl: String?
    let issueCommentUrl: String?
    let contentsUrl: String?
    let compareUrl: String?
    let mergesUrl: String?
    let archiveUrl: String?
    let downloadsUrl: String?
    let issuesUrl: String?
    let pullsUrl: String?
    let milestonesUrl: String?
    let notificationsUrl: String?
    let labelsUrl: String?
    let releasesUrl: String?
    let deploymentsUrl: String?
    let createdAt: String?
    let updatedAt: String?
    let pushedAt: String?
    let gitUrl: String?
    let sshUrl: String?
    let cloneUrl: String?
    let svnUrl: String?
    let homepage: String?
    let size: Int?
    let stargazersCount: Int?
    let watchersCount: Int?
    let language: String?
    let hasIssues: Bool?
    let hasProjects: Bool?
    let hasDownloads: Bool?
    let hasWiki: Bool?
    let hasPages: Bool?
    let hasDiscussions: Bool?
    let forksCount: Int?
    let mirrorUrl: String?
    let archived: Bool?
    let disabled: Bool?
    let openIssuesCount: Int?
    let license: License?
    let allowForking: Bool?
    let isTemplate: Bool?
    let webCommitSignoffRequired: Bool?
    let topics: [String]?
    let visibility: String?
    let forks: Int?
    let openIssues: Int?
    let watchers: Int?
    let defaultBranch: String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case nodeId = "node_id"
        case name = "name"
        case fullName = "full_name"
        case privateStatus = "private"
        case owner = "owner"
        case htmlUrl = "html_url"
        case description = "description"
        case fork = "fork"
        case url = "url"
        case forksUrl = "forks_url"
        case keysUrl = "keys_url"
        case collaboratorsUrl = "collaborators_url"
        case teamsUrl = "teams_url"
        case hooksUrl = "hooks_url"
        case issueEventsUrl = "issue_events_url"
        case eventsUrl = "events_url"
        case assigneesUrl = "assignees_url"
        case branchesUrl = "branches_url"
        case tagsUrl = "tags_url"
        case blobsUrl = "blobs_url"
        case gitTagsUrl = "git_tags_url"
        case gitRefsUrl = "git_refs_url"
        case treesUrl = "trees_url"
        case statusesUrl = "statuses_url"
        case languagesUrl = "languages_url"
        case stargazersUrl = "stargazers_url"
        case contributorsUrl = "contributors_url"
        case subscribersUrl = "subscribers_url"
        case subscriptionUrl = "subscription_url"
        case commitsUrl = "commits_url"
        case gitCommitsUrl = "git_commits_url"
        case commentsUrl = "comments_url"
        case issueCommentUrl = "issue_comment_url"
        case contentsUrl = "contents_url"
        case compareUrl = "compare_url"
        case mergesUrl = "merges_url"
        case archiveUrl = "archive_url"
        case downloadsUrl = "downloads_url"
        case issuesUrl = "issues_url"
        case pullsUrl = "pulls_url"
        case milestonesUrl = "milestones_url"
        case notificationsUrl = "notifications_url"
        case labelsUrl = "labels_url"
        case releasesUrl = "releases_url"
        case deploymentsUrl = "deployments_url"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case pushedAt = "pushed_at"
        case gitUrl = "git_url"
        case sshUrl = "ssh_url"
        case cloneUrl = "clone_url"
        case svnUrl = "svn_url"
        case homepage = "homepage"
        case size = "size"
        case stargazersCount = "stargazers_count"
        case watchersCount = "watchers_count"
        case language = "language"
        case hasIssues = "has_issues"
        case hasProjects = "has_projects"
        case hasDownloads = "has_downloads"
        case hasWiki = "has_wiki"
        case hasPages = "has_pages"
        case hasDiscussions = "has_discussions"
        case forksCount = "forks_count"
        case mirrorUrl = "mirror_url"
        case archived = "archived"
        case disabled = "disabled"
        case openIssuesCount = "open_issues_count"
        case license = "license"
        case allowForking = "allow_forking"
        case isTemplate = "is_template"
        case webCommitSignoffRequired = "web_commit_signoff_required"
        case topics = "topics"
        case visibility = "visibility"
        case forks = "forks"
        case openIssues = "open_issues"
        case watchers = "watchers"
        case defaultBranch = "default_branch"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        nodeId = try values.decodeIfPresent(String.self, forKey: .nodeId)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        fullName = try values.decodeIfPresent(String.self, forKey: .fullName)
        privateStatus = try values.decodeIfPresent(Bool.self, forKey: .privateStatus)
        owner = try values.decodeIfPresent(Owner.self, forKey: .owner)
        htmlUrl = try values.decodeIfPresent(String.self, forKey: .htmlUrl)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        fork = try values.decodeIfPresent(Bool.self, forKey: .fork)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        forksUrl = try values.decodeIfPresent(String.self, forKey: .forksUrl)
        keysUrl = try values.decodeIfPresent(String.self, forKey: .keysUrl)
        collaboratorsUrl = try values.decodeIfPresent(String.self, forKey: .collaboratorsUrl)
        teamsUrl = try values.decodeIfPresent(String.self, forKey: .teamsUrl)
        hooksUrl = try values.decodeIfPresent(String.self, forKey: .hooksUrl)
        issueEventsUrl = try values.decodeIfPresent(String.self, forKey: .issueEventsUrl)
        eventsUrl = try values.decodeIfPresent(String.self, forKey: .eventsUrl)
        assigneesUrl = try values.decodeIfPresent(String.self, forKey: .assigneesUrl)
        branchesUrl = try values.decodeIfPresent(String.self, forKey: .branchesUrl)
        tagsUrl = try values.decodeIfPresent(String.self, forKey: .tagsUrl)
        blobsUrl = try values.decodeIfPresent(String.self, forKey: .blobsUrl)
        gitTagsUrl = try values.decodeIfPresent(String.self, forKey: .gitTagsUrl)
        gitRefsUrl = try values.decodeIfPresent(String.self, forKey: .gitRefsUrl)
        treesUrl = try values.decodeIfPresent(String.self, forKey: .treesUrl)
        statusesUrl = try values.decodeIfPresent(String.self, forKey: .statusesUrl)
        languagesUrl = try values.decodeIfPresent(String.self, forKey: .languagesUrl)
        stargazersUrl = try values.decodeIfPresent(String.self, forKey: .stargazersUrl)
        contributorsUrl = try values.decodeIfPresent(String.self, forKey: .contributorsUrl)
        subscribersUrl = try values.decodeIfPresent(String.self, forKey: .subscribersUrl)
        subscriptionUrl = try values.decodeIfPresent(String.self, forKey: .subscriptionUrl)
        commitsUrl = try values.decodeIfPresent(String.self, forKey: .commitsUrl)
        gitCommitsUrl = try values.decodeIfPresent(String.self, forKey: .gitCommitsUrl)
        commentsUrl = try values.decodeIfPresent(String.self, forKey: .commentsUrl)
        issueCommentUrl = try values.decodeIfPresent(String.self, forKey: .issueCommentUrl)
        contentsUrl = try values.decodeIfPresent(String.self, forKey: .contentsUrl)
        compareUrl = try values.decodeIfPresent(String.self, forKey: .compareUrl)
        mergesUrl = try values.decodeIfPresent(String.self, forKey: .mergesUrl)
        archiveUrl = try values.decodeIfPresent(String.self, forKey: .archiveUrl)
        downloadsUrl = try values.decodeIfPresent(String.self, forKey: .downloadsUrl)
        issuesUrl = try values.decodeIfPresent(String.self, forKey: .issuesUrl)
        pullsUrl = try values.decodeIfPresent(String.self, forKey: .pullsUrl)
        milestonesUrl = try values.decodeIfPresent(String.self, forKey: .milestonesUrl)
        notificationsUrl = try values.decodeIfPresent(String.self, forKey: .notificationsUrl)
        labelsUrl = try values.decodeIfPresent(String.self, forKey: .labelsUrl)
        releasesUrl = try values.decodeIfPresent(String.self, forKey: .releasesUrl)
        deploymentsUrl = try values.decodeIfPresent(String.self, forKey: .deploymentsUrl)
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
        updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
        pushedAt = try values.decodeIfPresent(String.self, forKey: .pushedAt)
        gitUrl = try values.decodeIfPresent(String.self, forKey: .gitUrl)
        sshUrl = try values.decodeIfPresent(String.self, forKey: .sshUrl)
        cloneUrl = try values.decodeIfPresent(String.self, forKey: .cloneUrl)
        svnUrl = try values.decodeIfPresent(String.self, forKey: .svnUrl)
        homepage = try values.decodeIfPresent(String.self, forKey: .homepage)
        size = try values.decodeIfPresent(Int.self, forKey: .size)
        stargazersCount = try values.decodeIfPresent(Int.self, forKey: .stargazersCount)
        watchersCount = try values.decodeIfPresent(Int.self, forKey: .watchersCount)
        language = try values.decodeIfPresent(String.self, forKey: .language)
        hasIssues = try values.decodeIfPresent(Bool.self, forKey: .hasIssues)
        hasProjects = try values.decodeIfPresent(Bool.self, forKey: .hasProjects)
        hasDownloads = try values.decodeIfPresent(Bool.self, forKey: .hasDownloads)
        hasWiki = try values.decodeIfPresent(Bool.self, forKey: .hasWiki)
        hasPages = try values.decodeIfPresent(Bool.self, forKey: .hasPages)
        hasDiscussions = try values.decodeIfPresent(Bool.self, forKey: .hasDiscussions)
        forksCount = try values.decodeIfPresent(Int.self, forKey: .forksCount)
        mirrorUrl = try values.decodeIfPresent(String.self, forKey: .mirrorUrl)
        archived = try values.decodeIfPresent(Bool.self, forKey: .archived)
        disabled = try values.decodeIfPresent(Bool.self, forKey: .disabled)
        openIssuesCount = try values.decodeIfPresent(Int.self, forKey: .openIssuesCount)
        license = try values.decodeIfPresent(License.self, forKey: .license)
        allowForking = try values.decodeIfPresent(Bool.self, forKey: .allowForking)
        isTemplate = try values.decodeIfPresent(Bool.self, forKey: .isTemplate)
        webCommitSignoffRequired = try values.decodeIfPresent(Bool.self, forKey: .webCommitSignoffRequired)
        topics = try values.decodeIfPresent([String].self, forKey: .topics)
        visibility = try values.decodeIfPresent(String.self, forKey: .visibility)
        forks = try values.decodeIfPresent(Int.self, forKey: .forks)
        openIssues = try values.decodeIfPresent(Int.self, forKey: .openIssues)
        watchers = try values.decodeIfPresent(Int.self, forKey: .watchers)
        defaultBranch = try values.decodeIfPresent(String.self, forKey: .defaultBranch)
    }

}

struct Owner: Codable {
    let login: String?
    let id: Int?
    let nodeId: String?
    let avatarUrl: String?
    let gravatarId: String?
    let url: String?
    let htmlUrl: String?
    let followersUrl: String?
    let followingUrl: String?
    let gistsUrl: String?
    let starredUrl: String?
    let subscriptionsUrl: String?
    let organizationsUrl: String?
    let reposUrl: String?
    let eventsUrl: String?
    let receivedEventsUrl: String?
    let type: String?
    let siteAdmin: Bool?

    enum CodingKeys: String, CodingKey {

        case login = "login"
        case id = "id"
        case nodeId = "node_id"
        case avatarUrl = "avatar_url"
        case gravatarId = "gravatar_id"
        case url = "url"
        case htmlUrl = "html_url"
        case followersUrl = "followers_url"
        case followingUrl = "following_url"
        case gistsUrl = "gists_url"
        case starredUrl = "starred_url"
        case subscriptionsUrl = "subscriptions_url"
        case organizationsUrl = "organizations_url"
        case reposUrl = "repos_url"
        case eventsUrl = "events_url"
        case receivedEventsUrl = "received_events_url"
        case type = "type"
        case siteAdmin = "site_admin"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        login = try values.decodeIfPresent(String.self, forKey: .login)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        nodeId = try values.decodeIfPresent(String.self, forKey: .nodeId)
        avatarUrl = try values.decodeIfPresent(String.self, forKey: .avatarUrl)
        gravatarId = try values.decodeIfPresent(String.self, forKey: .gravatarId)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        htmlUrl = try values.decodeIfPresent(String.self, forKey: .htmlUrl)
        followersUrl = try values.decodeIfPresent(String.self, forKey: .followersUrl)
        followingUrl = try values.decodeIfPresent(String.self, forKey: .followingUrl)
        gistsUrl = try values.decodeIfPresent(String.self, forKey: .gistsUrl)
        starredUrl = try values.decodeIfPresent(String.self, forKey: .starredUrl)
        subscriptionsUrl = try values.decodeIfPresent(String.self, forKey: .subscriptionsUrl)
        organizationsUrl = try values.decodeIfPresent(String.self, forKey: .organizationsUrl)
        reposUrl = try values.decodeIfPresent(String.self, forKey: .reposUrl)
        eventsUrl = try values.decodeIfPresent(String.self, forKey: .eventsUrl)
        receivedEventsUrl = try values.decodeIfPresent(String.self, forKey: .receivedEventsUrl)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        siteAdmin = try values.decodeIfPresent(Bool.self, forKey: .siteAdmin)
    }

}

struct License: Codable {
    let key: String?
    let name: String?
    let spdxId: String?
    let url: String?
    let nodeId: String?

    enum CodingKeys: String, CodingKey {

        case key = "key"
        case name = "name"
        case spdxId = "spdx_id"
        case url = "url"
        case nodeId = "node_id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        key = try values.decodeIfPresent(String.self, forKey: .key)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        spdxId = try values.decodeIfPresent(String.self, forKey: .spdxId)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        nodeId = try values.decodeIfPresent(String.self, forKey: .nodeId)
    }

}
