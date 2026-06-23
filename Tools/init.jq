import hadoop

agent Assistant {

    memory:auto

    dataset Documents {

        source: "hdfs://documents"

        analyze {
            summarize
            classify
            embed
        }
    }

    on message(userText) {

        docs = Documents.search(
            userText
        )

        context = docs.summarize()

        return ai.reason(
            userText,
            context
        )
    }
}
