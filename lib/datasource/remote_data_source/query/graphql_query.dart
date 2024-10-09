const String loginMutation = """
  mutation Login(\$input: LoginUserInput!) {
    login(input: \$input) {
      ... on UserAuth {
        user {
          age
        }
        fingerPrint
      }
    }
  }
""";

const String verifyOtpMutation = """
  mutation VerifyEmailOtp(\$input: VerifyUserOtpInput!) {
    verifyEmailOtp(input: \$input) {
      ... on TokenResult {
        accessToken
      }
      ... on OtpUpdateError {
        message
      }
      ... on OtpInvalidError {
        message
      }
      ... on OtpExpiredError {
        message
      }
      ... on UserAccountDeactivatedError {
        message
      }
      ... on UserAccountNotFoundError {
        message
      }
    }
  }
""";

// Define your GraphQL query string
const String getConversationParticipantsQuery = r'''
      query GetConversationParticipants($after: String, $first: Int, $filter: ConversationParticipantFilter) {
        conversationParticipantsConnection(after: $after, first: $first, filter: $filter) {
          edges {
            node {
              id
              participantId
              conversationId
              participant {
                user {
                  firstName
                  lastName
                  username
                }
              }
              conversation {
                id
                lastInitiatorMessage {
            content
          }
                messagesConnection {
                  edges {
                    node {
                      content
                      id
                      sender {
                        user {
                          id
                          firstName
                          lastName
                        }
                      }
                    }
                  }
                }
              }
            }
          }
          pageInfo {
            hasNextPage
            endCursor
          }
          totalCount
        }
      }
    ''';