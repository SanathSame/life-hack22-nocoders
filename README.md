# life-hack22-nocoders

## Inspiration
Recycling is a big issue in Singapore. As the problem statement pointed out, Singapore's recycling rate has fallen to an all-time low. To develop a solution to foster recycling, we sought to first understand why it does not happen in the first place. The answer lay in a lack of education, not about the concept of recycling, but on what and what not to recycle. This problem has recently been popularised as **wishcycling**, where people have the best intentions in mind, but not the right discretion. Recyclops was born out of a need to address this issue and avoid non-recyclable materials going down the recyclable route and causing unncessary congestion, while also educating our users on recycling in a gamified manner.

## What it does
Recyclops is a platform-independent mobile application and can be run on mobile and web platforms alike. It captures an item’s image, quickly identifies your object and provides a real-time recommendation on whether the item is recyclable or not. If you choose to recycle it after having verified it first to not be a victim of wishcycling, you get Eco-coins, our in-app currency, on the app for having done a noble deed. One feature we're especially proud of is the impact. Once a user has finished recycling, a real-time screen updates to let him/her know what the impact of recyling that item was. Often, we are discouraged from acts of sustainabilty since we do not believe in the power of one. There is no greater incentive than knowing that one's actions as an individual can affect positive change on such a large scale. For example, if one person recycles tan aluminium can, letting them know that it will take a twelfth of the energy to make a new one than sourcing new materials, makes them feel validated for their action by establishing a one-to-one cause and effect. 
The gamified portion of the application is also a feature and a half in itself. It allows a community spirit towards recycling by assigning points to users who recycle frequently, and in good amounts. All the recycling statistics go towards making your Recyclops profile better and better.

## How we built it
The application was built using Google's **Flutter** framework written in Dart, with the image recognition made possible by the **YoloV5** and **Mobilenet SSD** models, coded in **TensorFlow Lite**, which is a deep learning framework for on-device inference. It allows training and deploying machine learning models on mobile devices. Google Colaboratory was also used as it allowed us to write and execute **Python** code through the browser, and is especially well suited to machine learning and data analysis. The authentication services are hosted on **Firebase**.

## Challenges we ran into
Since the timeframe for the project was short and our vision was ambitious, we had to realise that we could not realise the full potential of Recyclops so soon. Training an object detection model was highly time consuming and the model accuracy had to be improved considerably by feature engineering and adding more data points, which also had to be _manually labelled_ since there weren't reputed datasets for recyclable vs non recyclable items. Also, the TFLite packages available online were very outdated, requiring a deep dive into the package implementation and certain tweaks to make it work.

## Accomplishments that we're proud of
In retrospect, we're glad we did the image labelling manually since we can serve as a base dataset for anyone interested in this space. We hope to share our structured and labeled data on Kaggle for open-source use. As a team, we're proud of believing in ourselves to deliver the application that we had envisioned. The demo shows clearly how an item that a user is perplexed about recycling can be uploaded as an image or labelled directly through the camera, upon which it is detected with a sound accuracy and the user is instructed on whether its recyclable, along with a beneficial tip on how to recycle it in the right manner i.e. by cleaning or sanitizing.

## What we learned
In the span of twenty-four hours, the team can back itself as being confident of the Flutter tech stack, along with being well-informed in object detection models and their integration with Flutter using TFLite. We learnt about a very pressing problem of **wishcycling** and it is something, that we as individuals, are guilty of too. Oftentimes, our wish to recycle overlooks the recyclable nature of the item itself, and as such we cause more harm than good. By educating our users on the rights and wrongs, we foster two things: 
1. An educational thrive, built on a very simple scan-and-detect system.
2. A community spirit around recycling to be part of community leaderboards.

## What's next for Recyclops
Even while developing the smallest of features for the prototype, the team was always in discussion on where the idea could go next. 
In a development perspective, Recyclops wishes to work more on its feature building to make the application more robust. The model accuracy is something that will improve with the existence of the application, since the model will have more data points to work with. We wish to further bolster our leaderboards to feature exceptional recyclers and commend them, further incentivising people to become green champions. 
Holding a business lens, the team believes that its first go-to would be communities which not only wish to educate, but also foster a recycling spirit, since our application excels at both seamlessly. By partnering with companies interested in our initiative, we can allow users to get cashback and other such perks for recycling, thereby further

Credits:
https://github.com/garythung/trashnet for aid with data.
